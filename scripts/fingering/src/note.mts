export type AccidentalMode = "sharp" | "flat" | "both";
export type AccidentalType = "sharp" | "flat" | "double_sharp" | "double_flat";

export class Note {
  name: number;
  octave: number;
  accidental: boolean;

  midi: number;

  constructor(midi_number: number) {
    let notes = [
      "C",
      "C#",
      "D",
      "D#",
      "E",
      "F",
      "F#",
      "G",
      "G#",
      "A",
      "A#",
      "B",
    ];
    let note_names = {
      C: 0,
      D: 1,
      E: 2,
      F: 3,
      G: 4,
      A: 5,
      B: 6,
    };
    let note = notes[midi_number % 12];
    let octave = Math.floor(midi_number / 12) - 1;

    this.name = note_names[note[0]];
    this.octave = octave;
    this.accidental = note.length != 1;
    this.midi = midi_number;
  }

  // Difference in staff slots between this note and a reference
  staff_difference(other: Note, mode: AccidentalMode): number {
    if (other.midi == this.midi) {
      return 0;
    }

    let direction = other.midi < this.midi ? -1 : 1;
    let offset = 0;

    // Correct for octave
    let octave_distance = Math.abs(this.octave - other.octave);
    offset += direction * 7 * octave_distance;

    // Correct the inter-octave distance
    let note_distance = other.name - this.name;
    offset += note_distance;

    // Correct for flats, as they should be on the note while sharps are on the
    // same line
    if (mode == "flat" && this.accidental) {
      offset -= 1;
    }

    return offset;
  }
}
