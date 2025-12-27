abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "24."

        \new Staff \relative c'' {
            c1-4_\abrir d-3
            e-3_\cerrar d4-4 f-2 e-3 d-4
            c1-4_\abrir d-3
            e4-3_\cerrar c-4 e-3 d-5 c1-4

            \repeat volta 2 {
                d4-3_\abrir f-2 e-5 d-3 g-5 c,-4 d-3 e-5
                d-4_\cerrar f-2 e-3 d-4 g-5 c,-4 e-3 d-4
                c1-4_\abrir d-3
                e4-3_\cerrar c-4 e d-4 c1-4
            }

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            e4-3 c-5 d-4 e-3 f-2 d-5 e-4 f-3
            g-2 e-4 f-3 g-2 f2-3 g4-2 f-3
            e c d e f d e f
            g-2 e-4 g-2 f-3 e-4 g-2 e-3 c-4

            \repeat volta 2 {
                f4-2 d-4 g-5 f-3 e2-4 r2
                f4-3 d-4 g-2 f-3 e2-4 g4-2 f-3
                e-4 c-5 d-4 e-3 f-2 d-5 e-4 f-3
                g-2 e-4 g-2 f-3 e-4 g-2 c,2-4
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
