abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "12."

        \new Staff \relative c'' {
            \repeat volta 2 {
                c2-4_\abrir e4-5 c d2-3 f4-2 d
                e2-3_\cerrar g4-5 e-4 e-3 f-2 d-5 e-4
                c-3_\abrir e-4 g2-5 d4-3 f-2 g2-5
                e4-3_\cerrar e g-5 c,-4 d-5 e-3 e d-4
            }

            c4-4_\abrir c2 f4-2 c-4 c2 e4-5
            d-4_\cerrar e-3 f-2 g-5 f e d c
            c-4_\abrir f-2 f c-4 c e-5 e c-4
            d-4_\cerrar f-2 d-5 e-4 c2-3 c

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            \repeat volta 2 {
                c2-4 e4-3 c d2-3 f4-2 d-4
                e2-3 g4-2 e-4 e-3 f-2 d-4 e-3
                c-4 e-3 g2-5 d4-3 f-2 g2-5
                e4-3 e g-2 c,-4 d-3 e-2 e d-3
            }

            c4-4 c2 f4-2 c-4 c2 e4-3
            d-5 e-4 f-3 g-2 f e d-3 c-4
            c-5 f-2 f c-4 c e-3 e c-4
            d-3 f-2 d-3 e-2 c2-3 c

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
