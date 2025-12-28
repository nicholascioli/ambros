abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "29."

        \new Staff \relative c'' {
            e2-5_\abrir c4-4 d-3 e2 c4 d
            e2-3_\cerrar c4-4 e-3 d-4 e-3 f-2 d-4
            e2_\abrir c4 d e2 c4 d
            e-3_\cerrar g-5 e-3 d-5 c2-4 r2
            d4-3_\abrir e-5 f-2 d-3 e2-5 c-4
            d4-4_\cerrar e-3 f-2 d-4 e2-3 g-5
            e-5_\abrir c4 d e2 c4 d
            e_\cerrar g e d c2.-4 r4

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            c4-4 g'-5 e-3 g-5 c, g' e g
            c,-4 g'-2 e-3 g-2 f-3 e-4 d-5 g-2
            c,-4 g' e g c, g' e g
            c,-4 e-3 g-2 f-3 e-4 g-2 e-3 c-4
            f-2 e-3 d-4 g-5 c,-4 g' e g
            f-2 e-3 d-4 g-2 c,-4 g' e g
            c,-4 g' e g c, g' e g
            c, e g f e-4 g c,-4 r4

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
