abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "10."

        \new Staff \relative c'' {
            \time 3/4

            \repeat volta 2 {
                c4-4_\abrir e-5 e d-3 f-2 f
                e-3_\cerrar g-5 g f-2 e-3 d-4
            }

            e-5_\abrir  c-4 c f-2 d-3 d
            g-5_\cerrar d-4 e-3 c2.

            \fine
        }
        \new Staff \relative c' {
            \clef bass
            \time 3/4

            \repeat volta 2 {
                c4-4 e-3 e d-4 f-2 f
                e-3  g-2 g f-3 e-4 d-3
            }

            e-4 c-3 c f-2 d-4 d
            g-2 d-4 e-3 c2.-4

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
