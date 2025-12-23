// Fingering charts for both hands, open and closed, with only the accidental
// notes shown.
// Each button shows the accidental in both flat and sharp notation.

import fs from "node:fs/promises";
import path from "node:path";

import {
  ButtonBoard,
  Note,
  NOTE_MAPPINGS,
} from "../../../scripts/fingering/src/main.mts";

import type {
  AccidentalMode,
  Button,
  Direction,
  Hand,
} from "../../../scripts/fingering/src/main.mts";

let button_mapper =
  (hand: Hand, direction: Direction) =>
  (midi_number: number, index: number): Button => {
    return {
      hand,
      direction,
      index: index + 1,
      note: new Note(midi_number),
    };
  };

async function render_for(hand: Hand, direction: Direction, name: string) {
  let buttons = NOTE_MAPPINGS[hand][direction].map(
    button_mapper(hand, direction),
  );
  let board = new ButtonBoard(hand);

  // Accidental notes should render both flat and sharp
  // Natural notes should render with the equivalent flat and sharp variants (possibly double)
  let acc_offset = 3.2;
  let enharmonic_offset = 6;
  for (let btn of buttons) {
    if (btn.note.accidental) {
      board.drawButton(btn, { mode: "sharp", offset: -acc_offset });
      board.drawButton(btn, { mode: "flat", offset: acc_offset });
    } else {
      board.drawButton(btn, {});

      let render_adjacent = (dir: number) => {
        let adjacent = new Note(btn.note.midi + dir);

        // If the adjacent note is actually a natural note (thanks e/f & b/c)
        // then we render the equivalent button instead
        if (!adjacent.accidental) {
          board.drawButton(
            { hand, direction, index: btn.index, note: adjacent },
            {
              offset: enharmonic_offset * dir,
              forceAccidental: dir == -1 ? "sharp" : "flat",
            },
          );
        } else {
          board.drawButton(
            {
              hand,
              direction,
              index: btn.index,
              note: new Note(btn.note.midi + 2 * dir),
            },
            {
              offset: enharmonic_offset * dir,
              forceAccidental: dir == -1 ? "double_sharp" : "double_flat",
            },
          );
        }
      };

      render_adjacent(-1);
      render_adjacent(+1);
    }
  }

  await fs.writeFile(
    path.join(import.meta.dirname, "..", "..", "..", "imgs", name),
    board.render(),
  );
}

await render_for("left", "open", "teclado_no4_iz_abrir.svg");
await render_for("left", "close", "teclado_no4_iz_cerrar.svg");
await render_for("right", "open", "teclado_no4_de_abrir.svg");
await render_for("right", "close", "teclado_no4_de_cerrar.svg");
