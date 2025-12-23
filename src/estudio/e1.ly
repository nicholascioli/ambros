abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "1."

        \new Staff \relative c'' {
            \tempo "Moderato"

           c1-5_\abrir c-4_\cerrar
            d-3_\abrir d-4_\cerrar
            e-5_\abrir e-3_\cerrar
            f-2_\abrir f-2_\cerrar
            g-5_\abrir g-4_\cerrar

            \break

            g-5_\abrir g-4_\cerrar
            f-2_\abrir f-2_\cerrar
            e-5_\abrir e-3_\cerrar
            d-3_\abrir d-4_\cerrar
            c-5_\abrir c-4_\cerrar

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            c1-4 c-3
             d-4 d-3
             e-3 e-2
             f-3 f-2
             g-5 g-2

             \break

              g-5 g-2
              f-3 f-2
              e-3 e-2
              d-4 d-3
              c-4 c-3

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
