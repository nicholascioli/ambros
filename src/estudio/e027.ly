abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "27."

        \new Staff \relative c'' {
            c4-4_\abrir d-3 e-5 d-3 c2-4 r2
            d4-4_\cerrar e-3 f-2 e-3 d2-4 r2
            e4-5_\abrir f-2 g-5 f-2 e2-5 r2
            d4-4_\cerrar e f d-5 c2-4 r2
            d4-4_\abrir e-5 f-2 e-5 d2-4 r2
            e4-3_\cerrar f-2 g-5 f-2 e-3 c-4 e-3 d-4
            c-4_\abrir d e-5 d c2-4 r2
            d4-4 e f d-4 c-3 e-4 c2-3


            \fine
        }
        \new Staff \relative c' {
            \clef bass

            e2-3 g-5 e4-3 f-2 g-5 f-3
            f2-2 d-3 f4-2 e-3 d-4 g-2
            c,2-4 e-3 g4-5 e-3 g e
            f-2 e d g e-4 f-3 g-2 c,-4
            f2-2 d-4 f4-2 e-3 d-4 g-5
            c,2-4 e-3 g2.-2 f4-3
            e2-4 g-5 e4-3 f g e
            f-2 e d g e-3 g-2 c,2-4

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
