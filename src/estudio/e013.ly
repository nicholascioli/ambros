abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "13."

        \new Staff \relative c'' {
            c4-4_\abrir d-3 e-5 f-2 g-5 f e d
            c-4_\cerrar d-5 e-3 f-2 g-5 f e d-4
            c-4_\abrir  d-3 e f g f e d
            e-3_\cerrar c-4 e d-4 c2-3 r2

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            c2-4 r2 g'-5 r2
            c,-3 r2 g'-2 r2
            c,-4 r2 g'-5 r2
            c,-3 g'-2 c,-3 r2

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
