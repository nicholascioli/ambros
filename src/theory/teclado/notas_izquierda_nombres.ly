\new PianoStaff <<
    \new Staff \relative {
        \omit Staff.TimeSignature
        \clef treble
        \time 1/4

        \autoBreaksOff

        \repeat unfold 12 { s4 }
        a b c d e f g a b \bar "||"
    }

    \new Staff {
        <<
            \new Voice = "notas" \relative {
                \omit Staff.TimeSignature
                \clef bass
                \time 1/4

                \autoBreaksOff
                \override Lyrics.LyricSpace.minimum-distance = #2

                c,4 d e f g a b c d e f g a b c d e f g a b
            }

            \new Lyrics \lyricsto "notas" {
                \lyricmode {
                    \repeat unfold 3 {
                        DO RE ME FA SOL LA SI
                    }
                }
            }
        >>
    }
>>
