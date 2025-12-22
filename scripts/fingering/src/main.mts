import fs from "node:fs/promises";
import path from "node:path";

import { createSVGWindow } from "svgdom";
import { Element, SVG, registerWindow } from "@svgdotjs/svg.js";

import type { MappingReference, Mappings } from "./mapping.mts";
import { Note } from "./note.mts";

interface RenderTarget {
  svg: Element;
  reference: Array<number>;
  filter: (Note) => boolean;
}

interface StaffReference {
  align_at: Note;
  flip_at: Note;
  top: Note;
  bottom: Note;
  offset: NoteOffset;
}

interface NoteOffset {
  x: number;
  y: number;
}

const NOTE_OFFSET_LEFT = {
  x: 17.5,
  y: 17.9,
};
const NOTE_OFFSET_RIGHT = {
  x: 10.5,
  y: 9.25,
};

class Program {
  LHS_OFFSET = -100;

  asset_path: string;
  output_path: string;
  mappings: Mappings;

  left_svg: Element;
  right_svg: Element;

  constructor() {
    let args = process.argv;

    if (args.length != 4) {
      console.log(
        `usage: ${args[1]} <PATH/TO/ASSETS/FOLDER> <PATH/TO/OUTPUT/FOLDER>`,
      );

      return process.exit(1);
    }

    this.asset_path = path.resolve(args[2]);
    this.output_path = path.resolve(args[3]);

    // Set up needed shims for using SVG.js on nodejs
    const window = createSVGWindow();
    const document = window.document;
    registerWindow(window, document);
  }

  async load() {
    console.log("Loading button mappings...");
    this.mappings = JSON.parse(
      await fs.readFile(path.join(this.asset_path, "mappings.json"), {
        encoding: "utf-8",
      }),
    );

    let load = async (file: string): Promise<Element> => {
      let file_path = path.join(this.asset_path, file);
      console.log(`Loading fingering chart: ${file_path}`);

      let raw = await fs.readFile(file_path, {
        encoding: "utf-8",
      });

      return SVG(raw, false);
    };

    this.left_svg = await load("left_hand.svg");
    this.right_svg = await load("right_hand.svg");
  }

  async render(
    output_path: string,
    target: RenderTarget,
    staff: StaffReference,
    use_flat: boolean,
  ) {
    console.log(`Rendering to ${output_path}...`);

    let rendered = target.svg.clone(true);
    let note = rendered.findOne("g[inkscape|label='Note']").hide() as Element;

    let keys = rendered.findOne("g[inkscape|label='Keys']").children();
    keys.sort(
      (a, b) =>
        parseInt(a.attr("inkscape:label")) - parseInt(b.attr("inkscape:label")),
    );

    for (let i = 0; i != keys.length; ++i) {
      let key = keys[i];
      let circle = key.findOne("circle") as Element;
      let midi = new Note(target.reference[i]);

      // Filter out notes based on the output
      if (!target.filter(midi)) {
        continue;
      }

      console.log(
        `> Looking at ${note.attr("inkscape:label")} with note number ${JSON.stringify(midi)}`,
      );
      let to_add: Element = note.clone(true).insertBefore(key.first()).show();
      let note_head = to_add.findOne('path[inkscape|label="head"]') as Element;
      let space_offset = note_head.rbox().height / 2;

      // Center it on the staff, moving it to the correct line / space on the staff
      let staff_offset = midi.staff_difference(staff.align_at);
      to_add.translate(
        circle.cx() - staff.offset.x,
        circle.cy() - staff.offset.y + staff_offset * space_offset,
      );

      // Fix flipping if above the reference note
      let should_flip = midi.midi >= staff.flip_at.midi;
      if (should_flip) {
        let note_size = note_head.bbox();
        to_add.flip("both", { x: note_size.cx, y: note_size.cy } as any);
      }

      // Add accidental if needed
      if (midi.accidental) {
        let acc_name = use_flat ? "Flat" : "Sharp";
        let acc_type = should_flip ? "Down" : "Up";

        to_add.findOne(`g[inkscape|label="${acc_name} ${acc_type}"]`).show();
      }

      // Add ledger lines as needed
      if (midi.midi < staff.bottom.midi || midi.midi > staff.top.midi) {
        let distance = Math.abs(
          midi.staff_difference(
            midi.midi < staff.bottom.midi ? staff.bottom : staff.top,
          ),
        );

        let ledger_type = distance % 2 == 0 ? "Adjacent" : "Through";
        to_add.findOne(`path[inkscape|label="${ledger_type}"]`).show();

        // Add all other ledger lines as needed
        let needed = Math.ceil(distance / 2);
        for (let i = 1; i < needed; ++i) {
          to_add.findOne(`path[inkscape|label="${ledger_type}-${i}"]`).show();
        }
      }
    }

    console.log(`> Writing out ${output_path}`);
    await fs.writeFile(
      path.join(this.output_path, output_path),
      rendered.svg((n) => n.attr("id", null)),
    );
  }

  async run() {
    console.log(
      `Exporting from assets folder ${this.asset_path} to ${this.output_path}`,
    );

    let render_subset = async (
      hand: string,
      direction: string,
      staff: StaffReference,
    ) => {
      let ref = this.mappings.reference[hand][direction];
      let outputs = this.mappings.outputs[hand][direction];

      console.log(`Rendering ${hand} hand ${direction} diagrams...`);
      for (let output of Object.keys(outputs)) {
        let filter = eval(outputs[output]);

        await this.render(
          `${output}.svg`,
          // output,
          {
            svg: this[`${hand}_svg`],
            reference: ref,
            filter,
          },
          staff,
          false,
        );
      }
    };

    let left_staff = {
      top: new Note(59),
      bottom: new Note(41),
      align_at: new Note(55),
      flip_at: new Note(50),
      offset: NOTE_OFFSET_LEFT,
    };
    let right_staff = {
      top: new Note(79),
      bottom: new Note(62),
      align_at: new Note(65),
      flip_at: new Note(71),
      offset: NOTE_OFFSET_RIGHT,
    };

    await render_subset("left", "open", left_staff);
    await render_subset("left", "close", left_staff);
    await render_subset("right", "open", right_staff);
    await render_subset("right", "close", right_staff);
  }
}

let main = new Program();

await main.load();
await main.run();
