abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "2."

        \new Staff \relative c'' {
           c1-4_\abrir d-3
            c-4_\cerrar d-5
            d-4_\abrir e-5
            d-4_\cerrar e-3
            e-5_\abrir f-2
            e-4_\cerrar f-2
            f-2_\abrir g-5
            f-2_\cerrar g-4

            \break

            g-5_\abrir f-2
            g-5_\cerrar f-2
            f-2_\abrir e-5
            f-2_\cerrar e-4
            e-5_\abrir d-4
            e-4_\cerrar d-5
            d-4_\abrir c-5
            d-5_\cerrar c-3

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            c1-4 d-3
             c-4 d-3
             d-4 e-3
             d-3 e-2
             e-3 f-2
             e-3 f-2
             f-3 g-5
             f-3 g-2

             \break

             g-5 f-3
             g-2 f-3
             f-2 e-3
             f-2 e-3
             e-2 d-4
             e-2 d-3
             d-4 c-3
             d-2 c-3

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
