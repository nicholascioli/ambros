import path from "node:path";
import fs from "node:fs";

import { createSVGWindow } from "svgdom";
import { type Element, SVG, registerWindow } from "@svgdotjs/svg.js";

import { type Direction, type Hand } from "./main.mts";
import { Measurements, type StaffReference } from "./measurements.mts";
import { type AccidentalMode, type AccidentalType, Note } from "./note.mts";

export const NOTE_MAPPINGS = {
  left: {
    open: [
      38, 52, 47, 40, 50, 56, 67, 45, 57, 59, 69, 44, 55, 60, 62, 63, 46, 51,
      64, 66, 54, 49, 65, 48, 61, 39, 53, 58, 43, 42, 36, 68, 41,
    ],
    close: [
      40, 45, 52, 38, 43, 52, 66, 50, 55, 57, 68, 44, 58, 59, 61, 71, 46, 60,
      62, 64, 53, 51, 49, 65, 56, 37, 63, 48, 54, 47, 41, 67, 42,
    ],
  },
  right: {
    open: [
      79, 83, 85, 76, 80, 81, 86, 72, 74, 78, 87, 84, 69, 71, 75, 89, 88, 82,
      66, 68, 77, 91, 90, 67, 73, 70, 63, 92, 93, 62, 64, 65, 58, 95, 61, 60,
      59, 57,
    ],
    close: [
      75, 85, 88, 79, 81, 83, 86, 74, 76, 80, 87, 72, 71, 73, 76, 89, 84, 70,
      67, 69, 77, 90, 82, 68, 78, 64, 63, 92, 91, 61, 66, 65, 58, 93, 60, 62,
      59, 57,
    ],
  },
};

export const DEFAULT_RENDER_OPTIONS: RenderOptions = {
  mode: "sharp",
  offset: 0,
};

export interface RenderOptions {
  mode: AccidentalMode;
  offset: number;
  forceAccidental?: AccidentalType;
}

export interface Button {
  hand: Hand;
  direction: Direction;
  index: number;
  note: Note;
}

export class ButtonBoard {
  note_ref: Element;
  staff_ref: StaffReference;
  svg: Element;

  constructor(hand: Hand) {
    const window = createSVGWindow();
    const document = window.document;
    registerWindow(window, document);

    // Load the needed SVG
    let file_path = path.join(
      import.meta.dirname,
      "..",
      "assets",
      `${hand}_hand.svg`,
    );

    let raw = fs.readFileSync(file_path, {
      encoding: "utf-8",
    });

    this.svg = SVG(raw, false);
    this.note_ref = this.svg
      .findOne(labelForElement("g", "Note"))
      .hide() as Element;
    this.staff_ref = Measurements.staffRefFor(hand);
  }

  /**
   * Get the button index for a note given its midi number, hand, and direction
   * @param hand The hand for the note
   * @param direction The direction of play
   * @param note The MIDI note number
   */
  static buttonIndex(hand: Hand, direction: Direction, note: number): Button {
    let ref = NOTE_MAPPINGS[hand][direction];
    let index = ref.indexOf(note);

    if (index == -1) {
      throw `Note does not exist in the ${hand} when ${direction}ing`;
    }

    return {
      hand,
      direction,
      index: index + 1,
      note: new Note(note),
    };
  }

  /**
   * Draw a button to the specified hand diagram
   * @param button The button to render
   * @param opts Optional render options for the button
   */
  drawButton(btn: Button, options?: Partial<RenderOptions>) {
    let opts: RenderOptions = { ...DEFAULT_RENDER_OPTIONS, ...options };

    // Each button in the original SVG is labeled as its index, left padded with at most 1 "0"
    // e.g. button with index 5 is labeled as "05"
    let btn_ref = this.svg.findOne(
      labelForElement("g", btn.index.toString().padStart(2, "0")),
    ) as Element;
    // The circle is the inscribing circle around the staff of the button
    let circle_ref = btn_ref.findOne("circle") as Element;

    let to_render: Element = this.note_ref
      .clone(true)
      .insertAfter(btn_ref.last())
      .show();
    let note_head = to_render.findOne(
      labelForElement("path", "head"),
    ) as Element;
    let space_offset = note_head.rbox().height / 2;

    // Center it on the staff, moving it to the correct line / space on the staff
    let staff_offset = btn.note.staff_difference(
      this.staff_ref.align_at,
      opts.mode,
    );
    to_render.translate(
      circle_ref.cx() - this.staff_ref.offset.x + opts.offset,
      circle_ref.cy() - this.staff_ref.offset.y + staff_offset * space_offset,
    );

    // Fix flipping if above the reference note
    let should_flip = btn.note.midi >= this.staff_ref.flip_at.midi;
    if (should_flip) {
      let note_size = note_head.bbox();
      to_render.flip("both", { x: note_size.cx, y: note_size.cy } as any);
    }

    // Add accidental if needed
    let add_accidental = (acc_name: string) => {
      let acc_type = should_flip ? "Down" : "Up";

      to_render
        .findOne(labelForElement("g", `${acc_name} ${acc_type}`))
        .show()
        .attr("stroke", "black");
    };

    // Allow the user to render a note with any accidental
    // Otherwise, add the needed accidental symbol
    if (opts.forceAccidental !== undefined) {
      let acc_name = opts.forceAccidental
        .split("_")
        .map((w) => w.charAt(0).toUpperCase() + w.slice(1))
        .join(" ");

      add_accidental(acc_name);
    } else if (btn.note.accidental) {
      add_accidental(opts.mode == "sharp" ? "Sharp" : "Flat");
    }

    // Add ledger lines as needed
    let ledger_needed = (): boolean => {
      let bottom_acc =
        this.staff_ref.bottom.midi - (opts.mode == "sharp" ? 0 : 1);
      let top_acc = this.staff_ref.top.midi;

      let below_needed = btn.note.midi < bottom_acc;
      let above_needed = btn.note.midi > top_acc;

      return above_needed || below_needed;
    };

    if (ledger_needed()) {
      let distance = Math.abs(
        btn.note.staff_difference(
          btn.note.midi < this.staff_ref.bottom.midi
            ? this.staff_ref.bottom
            : this.staff_ref.top,
          opts.mode,
        ),
      );

      let ledger_type = distance % 2 == 0 ? "Adjacent" : "Through";
      to_render.findOne(labelForElement("path", ledger_type)).show();

      // Add all other ledger lines as needed
      let needed = Math.ceil(distance / 2);
      for (let i = 1; i < needed; ++i) {
        to_render
          .findOne(labelForElement("path", `${ledger_type}-${i}`))
          .show();
      }
    }
  }

  /**
   * Renders the drawn button board into an SVG as a string
   * @returns The rendered SVG as a string
   */
  render(): string {
    return this.svg.svg((n) => n.attr("id", null));
  }
}

/**
 * Formats a search string for a given type of element and corresponding inkscape label
 * @param el The type of element (e.g. path, g, etc.)
 * @param label The label of the element, as known in inkscape
 * @returns The search string for use with `findOne`
 */
function labelForElement(el: string, label: string): string {
  return `${el}[inkscape|label="${label}"]`;
}
