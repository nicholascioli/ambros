\score {
    <<
        \new Voice = "notas" {
            \clef bass

            \omit Staff.TimeSignature
            \omit Staff.KeySignature
            \cadenzaOn

            \relative c, {
                  d e f g a b
                c d e f g a b
                c d e f g   b
            }

            \bar "||"
        }

        \new Lyrics {
            \lyricmode {
                \repeat unfold 2 {
                    RE ME FA SOL LA SI DO
                }

                RE ME FA SOL SI
            }
        }
    >>

    \layout {
        ragged-right = ##f
        ragged-last = ##f
    }
}
