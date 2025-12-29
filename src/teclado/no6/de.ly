abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new Staff \relative c'' {
        \time 4/4

        \omit Staff.KeySignature
        \omit BarNumber
        \autoLineBreaksOff

        % Simple scale
        g4-2_\abrir a-4 b-3 c-5 d-4 c b a
        g4-3_\cerrar a-2 b-3 c-4 d-5 c b a

        % Jumps end
        g4-3_\abrir a-4 g-2 b-3 g-2 c-5 g-2 d'-4
        g,4-3_\cerrar a-2 g-3 b-4 g-3 c-4 g-3 d'-5

        \break

        % Jumps start
        g,-2_\abrir d'-4 c-5 d-4 b-3 d-4 a-3 d-4
        g,-3_\cerrar d'-5 c-4 d-5 b-4 d-5 a-2 d-5

        % Arpeggios
        g,-2_\abrir b-3 d-4 b-3 g b d b
        g-2_\cerrar b-4 d-5 b-4 g-3 b d b

        \break

        % Steps Up
        g-2_\abrir b-3 a-4 c-5 b-3 d-4 c-5 a-4
        g-3_\cerrar b-4 a-2 c-4 b-3 d-5 c-4 a-2

        % Steps Down
        d-4_\abrir b-3 c-5 a-4 b-3 g-2 a-4 c-5
        d-5_\cerrar b-3 c-4 a-2 b-4 g-3 a-2 c-4

        \break

        % Arp step down
        g-2_\abrir b-3 d-4 c-5 b-3 c-5 a-4 b-3
        g-2_\cerrar b-3 d-5 c-4 b-3 c-4 a-2 b-3

        % Jump step down
        g-2_\abrir d'-4 c-5 b-3 a-4 c-5 b-3 a-4
        g-3_\cerrar b-4 d-5 b-4 g2-3 r2

        \bar "||"
    }

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
