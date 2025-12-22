// Fingering charts for both hands, open and closed, with all notes for both
// directions on the same chart.
// Charts differ in whether to use sharps or flats for the notes.

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

async function render_for(hand: Hand, mode: AccidentalMode, name: string) {
  let open_buttons: Button[] = NOTE_MAPPINGS[hand]["open"].map(
    button_mapper(hand, "open"),
  );
  let close_buttons = NOTE_MAPPINGS[hand]["close"].map(
    button_mapper(hand, "close"),
  );

  let board = new ButtonBoard(hand);
  for (let i = 0; i != open_buttons.length; ++i) {
    let offset = close_buttons[i].note.accidental ? 3.2 : 2.5;

    board.drawButton(open_buttons[i], {
      mode,
      offset: -offset,
    });
    board.drawButton(close_buttons[i], {
      mode,
      offset: offset,
    });
  }

  await fs.writeFile(
    path.join(import.meta.dirname, "..", "..", "..", "imgs", name),
    board.render(),
  );
}

await render_for("left", "sharp", "teclado_no3_iz_sostenido.svg");
await render_for("left", "flat", "teclado_no3_iz_bemol.svg");
await render_for("right", "sharp", "teclado_no3_de_sostenido.svg");
await render_for("right", "flat", "teclado_no3_de_bemol.svg");
