abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "28."

        \new Staff \relative c'' {
            e4-4_\abrir g-5 d-3 g-5 c,-4 g' d-3 g
            e-3_\cerrar g-5 d-4 g c,-4 g'-5 e-3 c-4
            d-3_\abrir g c,-4 f f-2 g e-4 g
            d-4_\cerrar g c,-4 e-3 d2-5 r2
            e4-4_\abrir g d g c,-4 g' d g
            e-3_\cerrar g d g c,2-4 r2
            d4-2_\abrir g-5 c,-4 g' f-2 g-5 e-4 g-5
            e-3_\cerrar g-5 d-4 e-3 c-4 e-3 c2-4

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            g'2-5 f-3 e-4 f-3
            g-2 f-3 e-4 r2
            f2-2 e-3 d-4 c-4
            f-2 e4-3 c-4 g'-2 d-4 e-3 f-2
            g2-5 f-3 e-4 f-3
            g-2 f-4 e4-4 g-2 e-3 c-4
            f2-2 e-3 d-4 c-5
            g'-2 f4-3 g-2 e-3 g-2 c,2-4

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
