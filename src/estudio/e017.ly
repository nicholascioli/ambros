abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "17."

        \new Staff \relative c'' {
            c2-4_\abrir r2 g'-5 r2
            f-2_\cerrar r2 e-3 r2
            c_\abrir r2 g' r2
            f_\cerrar d-5 c-4 r2
            d-3_\abrir r2 c-4 r2
            f-2_\cerrar r2 e-3 r2
            d_\abrir c f-2 e-5
            d4-4_\cerrar e-3 d e d g-5 f-2 d-4
            c2-4_\abrir r2 g'-5 r2
            f-2_\cerrar r2 e-3 r2
            c_\abrir r2 g' r2
            f_\cerrar d-4 c-3 r2

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            e4-3 g-5 e-3 g-5 e g e g
            d-3 g-2 d g c,-4 g' c, g'
            e-3 g e g e g e g
            d-4 g-2 f-3 g e-4 g c,2-3
            f4-2 g-5 f g e-3 g-5 e g
            d-3 g-2 d g c,-4 g'-2 c, g'
            f-2 g-5 e-3 g-5 d-4 g-5 c,-4 e-3
            g2-2 r2 R1
            e4-3 g-5 e g e g e g
            d-3 g-2 d g c, g' c, g'
            e g e g e g e g
            d-4 g-2 f-3 g-2 e-3 g-2 c,2-4

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
