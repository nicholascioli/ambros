abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "19."

        \new Staff \relative c'' {
            \time 3/4

            c4-4_\abrir d-3 e-5 c d e
            d-4_\cerrar c-3 d e-3 e e
            c-4_\abrir d e c d e
            d-4_\cerrar e-3 d-5 c2.-4

            \repeat volta 2 {
                d4-3_\abrir c-4 d e-5 e c-4
                d-4_\cerrar c-3 d-4 e-3 e e
                c-4_\abrir d-3 e-5 c d e
                d-4_\cerrar e-3 d-5 c2.-3
            }

            \fine
        }
        \new Staff \relative c' {
            \clef bass
            \time 3/4

            R2. e4-4 f-2 g-5
            f-3 e-4 f g2.-2
            e4-3 f g e f g
            f-3 g-2 f e2.-4

            \repeat volta 2 {
                f4-2 e-3 f g-5 g e-3
                f-2 e-4 f-3 g2.-2
                e4-3 f-2 g-5 e f g
                f-3 g f e-4 g-2 c,-4
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
