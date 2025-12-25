abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "11."

        \new Staff \relative c'' {
            \time 3/4

            \repeat volta 2 {
                c4-4_\abrir c e-5 d-3 e-5 f-2
                e-4_\cerrar e g-5 f-2 d-4 e-3
            }

            f-2_\abrir  d-3 f e-5 c-4 e
            d-4_\cerrar d g-5 c,-3 e-4 c

            \fine
        }
        \new Staff \relative c' {
            \clef bass
            \time 3/4

            \repeat volta 2 {
                c4-4 c e-3 d-4 e-3 f-2
                e-3  e g-2 f-3 d-4 e-3
            }

            f-2 d-4 f e-3 c-4 e
            d-3 d g-2 c,-3 e-2 c

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
