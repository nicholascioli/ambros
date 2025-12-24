abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "7."

        \new Staff \relative c'' {
            \repeat volta 2 {
                c2.-4_\abrir  d4-3 e2.-5 f4-2
                d2.-4_\cerrar e4-3 f2.-2 g4-5
                e2.-5_\abrir  c4-4 g'2.-5 e4-4
                e2.-4_\cerrar d4-4 f2.-2 d4-4
            }

            c4-3_\abrir e-4 g-5 e-4 c-3 g'-5 c,2-3

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            \repeat volta 2 {
                c2.-5 d4-4 e2.-3 f4-2
                d2.-5 e4-4 f2.-3 g4-2
                e2.-3 c4-4 g'2.-5 e4-3
                e2.-2 d4-3 f2.-2 d4-3
            }

            c4-4 e-3 g-5 e-3 c-4 g'-5 c,2-4

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
