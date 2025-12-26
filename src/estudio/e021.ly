abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "21."

        \new Staff \relative c'' {
            e2-5_\abrir c-4 e c
            d-4_\cerrar d g-5 f-2
            e_\abrir c e c
            d4-4_\cerrar f-2 e-4 d-5 c-4 e-3 c2

            \repeat volta 2 {
                d2-3_\abrir d g-5 c,-4
                d-4_\cerrar d g-5 f-2
                e2_\abrir c e c
                d4-4 f-2 e-3 d c-3 e-4 c2
            }

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            c4-4 g'-5 e-3 g-5 c, g' e g
            f-3 g-2 f g e-3 g-2 d-4 g
            c,-4 g' e g c, g' e g
            f2-3 g-2 c,2.-4 e4-3

            \repeat volta 2 {
                f4 g f g e g e g
                f g f g e g d g
                c, g' e g c, g' e g
                f2 g c, r2
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
