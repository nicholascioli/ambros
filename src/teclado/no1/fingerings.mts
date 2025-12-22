// Fingering charts for both hands, open and closed, with only the natural
// notes shown.

import fs from "node:fs/promises";
import path from "node:path";

import {
  ButtonBoard,
  NOTE_MAPPINGS,
} from "../../../scripts/fingering/src/main.mts";

import type {
  Button,
  Direction,
  Hand,
} from "../../../scripts/fingering/src/main.mts";

// A filter for only natural notes
let natural_notes = (b: Button) => !b.note.accidental;

async function render_for(hand: Hand, direction: Direction, name: string) {
  let buttons = NOTE_MAPPINGS[hand][direction]
    .map((n) => ButtonBoard.buttonIndex(hand, direction, n))
    .filter(natural_notes);
  let board = new ButtonBoard(hand);

  for (let btn of buttons) {
    board.drawButton(btn);
  }

  await fs.writeFile(
    path.join(import.meta.dirname, "..", "..", "..", "imgs", name),
    board.render(),
  );
}

await render_for("left", "open", "teclado_no1_iz_abrir.svg");
await render_for("left", "close", "teclado_no1_iz_cerrar.svg");
await render_for("right", "open", "teclado_no1_de_abrir.svg");
await render_for("right", "close", "teclado_no1_de_cerrar.svg");
