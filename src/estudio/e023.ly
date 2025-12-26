abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "23."

        \new Staff \relative c'' {
            e4-5_\abrir c-4 d-3 e-5 f-2 d-3 e-5 f-2
            g-5_\cerrar c,-3 d-4 e-3 d2-4 r2
            e4-5_\abrir c d e f d e f
            g-5_\cerrar c,-4 e-3 d-4 c2-3 r2

            \repeat volta 2 {
                f4-2_\abrir d-3 e-5 f-2 g-5 c,-4 d-3 e-5
                f-2_\cerrar d-5 e-4 c-2 d2-4 r2
                e4_\abrir c d e f d e f
                g_\cerrar c, e d c2-3 c
            }

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            c2-5 r2 d-4 r2
            e-3 r2 g4-2 f-3 e-4 d-3
            c2-5 r2 d-4 r2
            e-3 g4-2 f-3 e-4 g-2 e-3 c-4

            \repeat volta 2 {
                d2-4 r2 e-3 r2
                g-2 f g4 f e d
                c2 r2 d2 r2
                e-3 g4-2 f-3 e-4 g-2 c,2-4
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
