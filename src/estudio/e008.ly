abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "8."

        \new Staff \relative c'' {
            \repeat volta 2 {
                c4-4_\abrir  g'2.-5 d4-3 g2.-5
                e4-3_\cerrar g2.-5  f4-2 d2.-4
            }

            c4-4_\abrir  g'2.-5 e4-4 c2.-3
            d2-5_\cerrar e-4 c1-3

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            \repeat volta 2 {
                c4-4 g'2.-5 d4-3 g2.-5
                e4-3 g2.-2  f4-3 d2.-5
            }

            c4-4 g'2.-5 e4-3 c2.-4
            d2-3 e-2 c1-3

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
