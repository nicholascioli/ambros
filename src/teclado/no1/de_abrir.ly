\score {
    <<
        \new Voice = "notas" {
            \clef treble

            \omit Staff.TimeSignature
            \omit Staff.KeySignature
            \cadenzaOn

            \relative c' {
                a b
                c d e f g a b
                c d e f g a b
                c d e f g a b
            }

            \bar "||"
        }

        \new Lyrics {
            \lyricmode {
                LA SI

                \repeat unfold 3 {
                    DO RE ME FA SOL LA SI
                }
            }
        }
    >>

    \layout {
        ragged-right = ##f
        ragged-last = ##f
    }
}
