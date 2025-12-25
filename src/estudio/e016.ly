abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "16."

        \new Staff \relative c'' {
            c4-4_\abrir e-5 d-3 f-2 e-5 c-4 d2-3
            c4-4_\cerrar e-3 d-5 f-2 e-3 d-5 c2-4
            d4-3_\abrir e-5 c-4 g'-5 f-2 e-5 d2-3
            c4_\cerrar e d f e d-4 c2-3

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            c2-4 g'-5 c,-4 g'4-5 f-2
            e-3 c-4 f-2 d-3 g-2 f-3 e-4 c-3
            f-2 g-5 e2-3 d4-3 c-4 g'-5 f-2
            e c f d g2 c,2-4

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
