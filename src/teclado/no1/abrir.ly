\score {
    <<
        \new Voice = "notas" {
            \clef bass

            \omit Staff.TimeSignature
            \omit Staff.KeySignature
            \cadenzaOn

            \relative c, {
                c d e f g a b
                c d e f g a b
                c d e f g a
            }

            \bar "||"
        }

        \new Lyrics {
            \lyricmode {
                \repeat unfold 2 {
                    DO RE ME FA SOL LA SI
                }

                DO RE ME FA SOL LA
            }
        }
    >>

    \layout {
        ragged-right = ##f
        ragged-last = ##f
    }
}
