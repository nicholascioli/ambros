abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "5."

        \new Staff \relative c'' {
            \repeat volta 2 {
               c2-4_\abrir  d-3 e-5 f-2
                g-5_\cerrar f-2 e-3 d-4
            }

            c-4_\abrir e-5 d-3 f-2
            e-3_\cerrar g-5 f-2 d-4
            c-4_\abrir g'-5 c,1-4

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            \repeat volta 2 {
               c2-4  d-5 e-4 f-3
                g-2 f-3 e-4 d-3
            }

            c-4 e-3 d-4 f-2
            e-3 g-2 f-3 d-4
            c-3 g'-5 c,1-3

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
