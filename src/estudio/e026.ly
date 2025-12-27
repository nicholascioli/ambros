abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "26."

        \new Staff \relative c'' {
            c4-4_\abrir e-5 c-3 e-4 g-5 e-4 g e
            d-3_\cerrar f-2 d f g-5 f-2 e-3 d-4
            c-4_\abrir e-5 c-3 e-4 g-5 e-4 g e
            d-3_\cerrar f-2 e-3 d-4 c-3 e-4 c2

            \repeat volta 2 {
                f4-2_\abrir d-3 f d e-5 c-4 e c
                f-2_\cerrar d-5 e-4 c-3 d-4 g-5 f-2 d-3
                c-3_\abrir e-4 c e g-5 e-4 g e
                d-3_\cerrar f-2 e-3 d-4 c-3 e-4 c2
            }

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            c1-4 e-3
            f-2 d2-3 g-2
            c,1-4 e-3
            f4-2 d-3 g2-2 c,2.-4 e4-3

            \repeat volta 2 {
                g2-5 r2
                c,2.-4 e4-3
                g2-2 c,4-4 e-3 g2-2 r2
                c,1-4 e-3
                f4-2 d-3 g2-2
                c,2-4 r2
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
