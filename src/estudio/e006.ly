abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "6."

        \new Staff \relative c'' {
            \repeat volta 2 {
               c4-4_\abrir  d-3 e-5 f-2 g-5 f-2 e-5 d-3
                c-4_\cerrar d-5 e-3 f-2 g-5 f-2 e-3 d-4
            }

            c-3_\abrir e-4 g-5 f-2 e-5 d-3 c-4 e-5
            d-4_\cerrar g-5 f-2 d-4 c-3 e-4 c2-3

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            \repeat volta 2 {
               c4-5 d-4 e-3 f-2 g-5 f-2 e-4 d-5
                c-4 d-3 e-2 f-3 g-2 f-3 e-4 d-3
            }

            c-4 e-3 g-5 f-2 e-3 d-4 c-5 e-3
            d-3 g-2 f-3 d-4 c-5 e-3 c2-2

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
