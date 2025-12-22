// Fingering charts for both hands, open and closed, with only the accidental
// notes shown.
// Each button shows the accidental in both flat and sharp notation.

import fs from "node:fs/promises";
import path from "node:path";

import {
  ButtonBoard,
  NOTE_MAPPINGS,
} from "../../../scripts/fingering/src/main.mts";

import type {
  AccidentalMode,
  Button,
  Direction,
  Hand,
} from "../../../scripts/fingering/src/main.mts";

// A filter for only accidental notes
let accidental_notes = (b: Button) => b.note.accidental;

async function render_for(hand: Hand, direction: Direction, name: string) {
  let buttons = NOTE_MAPPINGS[hand][direction]
    .map((n) => ButtonBoard.buttonIndex(hand, direction, n))
    .filter(accidental_notes);
  let board = new ButtonBoard(hand);

  let render_with_mode = async (mode: AccidentalMode, offset: number) => {
    for (let btn of buttons) {
      board.drawButton(btn, { mode, offset });
    }
  };

  let offset = 3.2;
  await render_with_mode("flat", offset);
  await render_with_mode("sharp", -offset);

  await fs.writeFile(
    path.join(import.meta.dirname, "..", "..", "..", "imgs", name),
    board.render(),
  );
}

await render_for("left", "open", "teclado_no2_iz_abrir.svg");
await render_for("left", "close", "teclado_no2_iz_cerrar.svg");
await render_for("right", "open", "teclado_no2_de_abrir.svg");
await render_for("right", "close", "teclado_no2_de_cerrar.svg");
