abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "32."

        \new Staff \relative c'' {
            \repeat volta 2 {
                g4-3_\abrir a-4 b-3 a g2-3 r2
                a4-2_\cerrar b-3 c-4 b a2-2 r2
                b4-3_\abrir c-4 d-3 c b2-3 r2
                a4-2_\cerrar b-3 c-4 a g2-3 r2
            }

            \break

            \repeat volta 2 {
                a4-3_\abrir b-3 c-5 b a2-4 r2
                b4-3_\cerrar c-4 d-5 c b-3 g-2 b a-2
                g_\abrir a b a g2 r2
                a4_\cerrar b c a-2 g-3 b-4 g2
            }

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            \repeat volta 2 {
                b2-4 d-3 b4-4 c-3 d-2 b
                c2-2 a-4 c4-2 b-3 a-4 d-2
                g,2-3 b-4 d4-3 b-4 d b
                c-2 b-3 a-4 d-2 b-4 c-3 d-2 g,-5
            }

            \repeat volta 2 {
                c2-3 a-4 c4-3 b-4 a-5 d-3
                g,2-5 b-4 d2.-2 c4-3
                b2 d b4 c d b
                c b a d b-3 d-2 g,2-5
            }

            \fine
        }
    >>

    \layout {
        ragged-right = ##f
        ragged-last = ##f

        % No bar lines please
        \context {
            \Score
            \omit BarNumber
        }
    }
}
