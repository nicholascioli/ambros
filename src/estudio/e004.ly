abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "4."

        \new Staff \relative c'' {
            \repeat volta 2 {
               c1-5_\abrir  d-4
                e-4_\cerrar f-2
                g-5_\abrir  f-2
                e-3_\cerrar d-4
            }

           c2-3_\abrir e-4 g-5 e-4
            c-3_\cerrar e-4 c1-3

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            \repeat volta 2 {
               c1-5  d-4
                e-3 f-2
                g-5  f-3
                e-2 d-3
            }

           c2-4 e-3 g-5 e-3
            c-4 e-2 c1-3

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
