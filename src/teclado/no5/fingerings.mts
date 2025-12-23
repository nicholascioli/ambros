// Fingering charts for both hands, open and closed, with only a few C Major
// notes shown.

import fs from "node:fs/promises";
import path from "node:path";

import {
  ButtonBoard,
  Note,
  NOTE_MAPPINGS,
} from "../../../scripts/fingering/src/main.mts";

import type {
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

function inRange(btn: Button, start: number, stop: number): boolean {
  return btn.note.midi >= start && btn.note.midi <= stop;
}

// A filter for the notes for the following exercises
let notesFor = (hand: Hand) => {
  let range = { left: [60, 67], right: [72, 79] };

  return (b: Button) =>
    !b.note.accidental && inRange(b, range[hand][0], range[hand][1]);
};

async function render_for(hand: Hand, direction: Direction, name: string) {
  let buttons = NOTE_MAPPINGS[hand][direction]
    .map(button_mapper(hand, direction))
    .filter(notesFor(hand))
    // The right hand has a duplicate note in this range, but the book ignores
    // it for this chapter.
    .filter((b) => !(hand == "right" && b.index == 15));
  let board = new ButtonBoard(hand);

  for (let btn of buttons) {
    board.drawButton(btn);
  }

  await fs.writeFile(
    path.join(import.meta.dirname, "..", "..", "..", "imgs", name),
    board.render(),
  );
}

await render_for("left", "open", "teclado_no5_iz_abrir.svg");
await render_for("left", "close", "teclado_no5_iz_cerrar.svg");
await render_for("right", "open", "teclado_no5_de_abrir.svg");
await render_for("right", "close", "teclado_no5_de_cerrar.svg");
