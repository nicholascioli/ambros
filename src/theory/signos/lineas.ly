\score {
    <<
        \new Staff \relative {
            \cadenzaOn

            \omit Beam
            \omit Flag
            \omit Staff.TimeSignature
            \omit Staff.Clef
            \omit Stem


            \override NoteHead.stencil = #ly:text-interface::print
            \override NoteHead.text = \markup { "1" }
            d'4
            \override NoteHead.text = \markup { "2" }
            f
            \override NoteHead.text = \markup { "3" }
            a
            \override NoteHead.text = \markup { "4" }
            c
            \override NoteHead.text = \markup { "5" }
            e

            \override NoteHead.text = \markup { "1" }
            e,
            \override NoteHead.text = \markup { "2" }
            g
            \override NoteHead.text = \markup { "3" }
            b
            \override NoteHead.text = \markup { "4" }
            d

            \bar "|"
        }

        \new Dynamics {
            \override DynamicText.self-alignment-Y = #CENTER
            s1^\markup { "Las 5 lineas y 4 espacios" }
        }

        \new Staff \relative{
            \cadenzaOn

            \omit Beam
            \omit Flag
            \omit Staff.TimeSignature
            \omit Staff.Clef
            \omit Stem

            e'4 g b d f f, a c e \bar "|"
        }
    >>
}
