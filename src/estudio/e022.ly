abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "22."

        \new Staff \relative c'' {
            _\abrir R1 c4-3 e-4 g-5 e-4
            d-3_\cerrar f-2 e-3 d-4 e2-3 r2
            c4_\abrir e g e c2-3 e-5
            d4-4_\cerrar f-2 e-4 d-5 c-4 e-3 c2-4

            \repeat volta 2 {
                d4-3_\abrir e-5 c2-4 d4 e c2
                d4-4_\cerrar e-3 f-2 g-5 f-2 e-4 d-5 c-4
                d-3_\abrir e c2 d4 e c2
                d4-4_\cerrar f-2 e-3 d-4 c-3 e-4 c2
            }

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            c4-4 e-3 g-5 e-3 c2-5 e-4
            f-3 g-2 c,4-4 e-3 g-2 e-3
            c2-4 r2 c4 e g e-4
            f2-3 g-2 c,2.-4 e4-3

            \repeat volta 2 {
                f4-2 g-5 e-3 c-4 f g e c
                d-3 e-2 f-3 g-1 f-3 e-4 d-3 c-4
                f-2 g e c f g e c
                f-3 d-4 g-2 f-3 e-4 g-2 c,2
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
