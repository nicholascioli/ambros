\new PianoStaff <<
    \new Staff
    <<
        \new Voice = "notas" \relative {
            \omit Staff.TimeSignature
            \clef treble
            \time 1/4

            \autoBreaksOff
            \override Lyrics.LyricSpace.minimum-distance = #2

            a4 b c d e f g
            a b c d e f g
            a b c d e f g

            a b \bar "||"
        }

        \new Lyrics \lyricsto "notas" {
            \lyricmode {
                \repeat unfold 3 {
                    LA SI DO RE ME FA SOL
                }

                LA SI
            }
        }
    >>

    \new Staff \relative {
        \omit Staff.TimeSignature
        \clef bass
        \time 1/4

        \autoBreaksOff

        a4 b c d e f g a b

        \repeat unfold 14 { s4 }
    }
>>
