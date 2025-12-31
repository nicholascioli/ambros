abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "31."

        \new Staff \relative c'' {
            \repeat volta 2 {
                g2-2_\abrir r2 d'-4 c-5
                b4-4_\cerrar d-5 c-4 b-3 a2 r2
                g-2_\abrir r2 d'-4 c-5
                b4-3_\cerrar d-5 c-4 a-2 g2-3 r2
            }

            \break

            \repeat volta 2 {
                a2-4_\abrir r2 g4-2 d'-4 c-5 b-3
                a2-2_\cerrar r2 d4-5 g,-3 b-4 a-2
                g2-3_\abrir r2 d' c
                b4_\cerrar d c a-2 g2-3 r2
            }

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            \repeat volta 2 {
                g4-4 d'-3 b-4 d-3 b d a-5 d-3
                g,2-5 a4-4 b-3 c-2 a-4 d-2 c-3
                b-4 d-3 b d b d a-5 d-3
                g,2-5 d'-3 b4-4 d-3 g,-5 d'
            }

            \repeat volta 2 {
                c-4 d-3 c d b2-5 r2
                c4-3 d-2 c d b2-4 d4-2 c-3
                b-4 d-3 b d b-4 d-3 a-5 d-3
                g,2 d' b4-4 d-3 g,2-5
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
