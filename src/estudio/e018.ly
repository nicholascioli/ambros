abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "18."

        \new Staff \relative c'' {
            \time 3/4

            c4-4_\abrir d-3 e-5 e d c
            d-4_\cerrar e-3 d-4 c-3 g'-5 g
            c,_\abrir d e e d c
            d-5_\cerrar e-4 d-5 c2.-4

            \repeat volta 2 {
                d4-3_\abrir e-5 d c-4 g'-5 g
                d-4_\cerrar e-3 d c-3 g'-5 g
                c,_\abrir d e e d c
                d_\cerrar e d c2.-3
            }

            \fine
        }
        \new Staff \relative c' {
            \clef bass
            \time 3/4

            % The original scan had fingerings to the left or right of the
            % chords
            \set fingeringOrientations = #'(right)
            <e-3 g-5>2. <e g>
            <f-3 g-2>   <e-4 g-2>
            <e g>       <e g>

            \set fingeringOrientations = #'(up)
            <f g>       e4-3 g-2 c,-3

            \repeat volta 2 {
                \set fingeringOrientations = #'(right)
                <f-2 g-5>2. <e g>
                <f-3 g-2>   <e g>

                \set fingeringOrientations = #'(up)
                R2. g4-5 f-2 e-4

                f-2 g-5 d e-4 g-2 c,-3
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
