abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "3."

        \new Staff \relative c'' {
           c1-4_\abrir e-5
            c-4_\cerrar e-3
            d-3_\abrir f-2
            d-4_\cerrar f-2
            e-4_\abrir g-5
            e-3_\cerrar g-4

            \break

            g-5_\abrir e-4
            g-5_\cerrar e-3
            f-2_\abrir d-4
            f-2_\cerrar d-4
            e-5_\abrir c-4
            e-3_\cerrar c-4

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            c1-4 e-3
             c-4 e-2
             d-4 f-2
             d-3 f-2
             e-3 g-5
             e-3 g-2

             \break

             g-5 e-3
             g-2 e-3
             f-2 d-4
             f-2 d-3
             e-3 c % TODO: Missing fingering in original?
             e-2 c-3

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
