abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "30."

        \new Staff \relative c'' {
            \time 3/4

            \repeat volta 2 {
                g4-3_\abrir b-4 g a2.-5
                g4-4_\cerrar b-5 g a2.-3
                g4-2_\abrir b-3 d-4 d c-5 a-4
                b-4_\cerrar c-5 a-2 g2.-3
            }

            \break

            \repeat volta 2 {
                a4-4_\abrir b-3 a g-2 b-3 d-4
                a-2_\cerrar b-4 a g-3 b-4 d-5
                a-4_\abrir b-3 a g b d-5
                c-4_\cerrar b-3 a-2 g2.-3
            }

            \fine
        }
        \new Staff \relative c' {
            \clef bass
            \time 3/4

            \repeat volta 2 {
                b2.-5 c4-4 d-3 c
                b2.-4 c4-3 d-2 c
                b2.-5 c-4
                d2-2 c4-3 b-4 d-3 g,-5
            }

            \repeat volta 2 {
                c2.-4 b-5
                c-3 b-4
                c4-4 d-3 c b2.-5
                r4 d-3 c-4 b-5 d g
            }

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
