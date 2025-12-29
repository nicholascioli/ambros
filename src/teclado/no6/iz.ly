abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new Staff \relative c' {
        \clef bass
        \time 4/4

        \omit Staff.KeySignature
        \omit BarNumber
        \autoLineBreaksOff

        % Simple scale
        g4-2_\abrir a-4 b-3 c-5 d-4 c b a
        g4-3_\cerrar a-2 b-3 c-4 d-5 c b a

        % Jumps end
        g4-4_\abrir a-5 g-4 b-5 g-4 c-4 g-4 d'-2
        g,4-5_\cerrar a-4 g-5 b-3 g-5 c-3 g-5 d'-2

        \break

        % Jumps start
        g,-4_\abrir d'-3 c-4 d-3 b-4 d-3 a-5 d-3
        g,-5_\cerrar d'-3 c-4 d-3 b-4 d-3 a-5 d-3

        % Arpeggios
        g,-4_\abrir b-5 d-3 b-5 g b d b-4
        g-5_\cerrar b-4 d-3 b-4 g b d b

        \break

        % Steps Up
        g-3_\abrir b-4 a-5 c-3 b-4 d-3 c-4 a-5
        g-5_\cerrar b-3 a-4 c-3 b-4 d-2 c-3 a-4

        % Steps Down
        d-3_\abrir b-4 c-3 a-5 b-4 g-3 a-5 c-3
        d-2_\cerrar b-4 c-3 a-4 b-3 g-5 a-4 c-3

        \break

        % Arp step down
        g-4_\abrir b-5 d-2 c-3 b-4 c-3 a-5 b-4
        g-5_\cerrar b-4 d-2 c-3 b-4 c-3 a-5 b-3

        % Jump step down
        g-4_\abrir d'-2 c-3 b-4 a-5 c-3 b-4 a-5
        g-5_\cerrar b-4 d-3 b-4 g2-5 r2

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
