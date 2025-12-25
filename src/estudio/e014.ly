abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "14."

        \new Staff \relative c'' {
            c2-4_\abrir r2 g'-5 r2
            c,-3_\cerrar r2 g'-5 r2
            c,-4_\abrir r2 g'-5 r2
            c,-3_\cerrar g'-5 c,-3 r2

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            c4-5 d-4 e-3 f-2 g-5 f e-4 d-5
            c-4 d-3 e-2 f-3 g-2 f e-4 d-3
            c-5 d-4 e f g f e-3 d-4
            e-3 g-2 e g c,2-3 r2

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
