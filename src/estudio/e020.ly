abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "20."

        \new Staff \relative c'' {
            c2.-4_\abrir e4-5 c2. e4
            d2-4_\cerrar d-5 e-4 c-3
            c2.-4_\abrir e4 c2. e4
            d2-4_\cerrar d4 e-3 c2-4 r2

            \repeat volta 2 {
                d2-3_\abrir d-2 c4-3 e-4 g-5 e
                d2-3_\cerrar d-4 e-3 d-4
                c2.-4_\abrir e4-5 c2. e4
                d2-4_\cerrar d4 e c2-4 r2
            }

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            e4-3 g-5 e g e g e g
            f-3 g-2 f g e-4 g e g
            e-3 g e g e g e g
            f-3 g f g e-3 g-2 c,2-4

            \repeat volta 2 {
                f4-2 g-5 f g e2-3 r2
                f4-3 g-2 f g e-3 g-2 f-3 g-2
                e-3 g-5 e g e g e g
                f-3 g-2 f g e-3 g-2 c,2-4
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
