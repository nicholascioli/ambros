abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "25."

        \new Staff \relative c'' {
            \time 3/4

            g'4-5_\abrir f-2 e-5 e d-3 c-4
            d-4_\cerrar e-3 d-4 c-3 d-4 e-3
            g_\abrir f e e d c
            d-4_\cerrar e-3 d c2.-3

            \break

            \repeat volta 2 {
                f4-2_\abrir g-5 f-2 e-5 d-3 c-4
                d-4_\cerrar e-3 d-4 c-3 d-4 e-3
                g-5_\abrir f-2 e-5 e-5 d-3 c-4
                d-4_\cerrar e-3 d c2.-3
            }

            \fine
        }
        \new Staff \relative c' {
            \clef bass
            \time 3/4

            R2. g'4-5 f-3 e-4
            f-3 g-2 f-3 e-4 d-3 c-4
            R2. g'4 f e
            f g f e-4 g-2 c,-4

            \repeat volta 2 {
                d4-5 e-4 d-5 c-4 d-5 e-4
                f-2 g f e d c
                R2. g'4-5 f-3 e-4
                f-3 g-2 f-3 e-4 g-2 c,-4
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
