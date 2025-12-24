abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "9."

        \new Staff \relative c'' {
            \repeat volta 2 {
                c4-4_\abrir  d2-3 e4-5 d4-3 e2-5 f4-2
                e4-3_\cerrar f2-2 g4-5 f4-2 e-3  d2-4
            }

            f4-2_\abrir  d2-3 g4-5 e4-4 d2-3 c4-4
            d4-4_\cerrar e2-3 d4-4 c4-3 e-4  c2-3

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            \repeat volta 2 {
                c4-4 d2-3 e4-2 d4-4 e2-3 f4-2
                e4-4 f2-3 g4-2 f4-3 e-4  d2-3
            }

            f4-2 d2-4 g4-5 e4-2 d2-3 c4-4
            d4-3 e2-2 d4-3 c4-4 e-2  c2-3

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
