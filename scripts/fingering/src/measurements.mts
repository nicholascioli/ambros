import type { Hand } from "./main.mts";
import { Note } from "./note.mts";

export interface StaffReference {
  align_at: Note;
  flip_at: Note;
  top: Note;
  bottom: Note;
  offset: NoteOffset;
}

export interface NoteOffset {
  x: number;
  y: number;
}

/**
 * Manual measurements taken to best fit notes on each button staff
 */
export class Measurements {
  static NOTE_OFFSET_LEFT: NoteOffset = {
    x: 17.5,
    y: 17.9,
  };
  static NOTE_OFFSET_RIGHT: NoteOffset = {
    x: 10.5,
    y: 9.25,
  };

  static LEFT_STAFF_REF: StaffReference = {
    top: new Note(59),
    bottom: new Note(41),
    align_at: new Note(55),
    flip_at: new Note(50),
    offset: Measurements.NOTE_OFFSET_LEFT,
  };

  static RIGHT_STAFF_REF: StaffReference = {
    top: new Note(79),
    bottom: new Note(62),
    align_at: new Note(65),
    flip_at: new Note(71),
    offset: Measurements.NOTE_OFFSET_RIGHT,
  };

  static staffRefFor(hand: Hand): StaffReference {
    return hand == "left" ? this.LEFT_STAFF_REF : this.RIGHT_STAFF_REF;
  }
}
