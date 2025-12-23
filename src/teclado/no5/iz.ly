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
        c-5_\abrir d-4 e-3 f-2 g-5 f-2 e-3 d-5
        c-4_\cerrar d-3 e-2 f-3 g-2 f-3 e-4 d-5

        % Jumps end
        c-4_\abrir d-3 c-4 e-3 c-4 f-2 c-3 g'-5
        c,-4_\cerrar d-3 c-4 e-3 c-4 f-3 c-4 g'-2

        \break

        % Jumps start
        c,-3_\abrir g'-5 f-2 g-5 e-2 g-5 d-3 g-5
        c,-4_\cerrar g'-2 f-3 g-2 e-3 g-2 d-4 g-2

        % Arpeggios
        c,-4_\abrir e-3 g-5 e-3 c-4 e-3 g-5 e-3
        c-4_\cerrar e-3 g-2 e-3 c-4 e-3 g-2 e-3

        \break

        % Sus
        d-4_\abrir f-2 g-5 f-2 d-4 e-3 f-2 e-3
        d-4_\cerrar f-3 g-2 f-3 d-4 e-3 f-2 e-3

        % Steps Up
        c-4_\abrir e-3 d-4 f-2 e-3 g-5 f-2 d-3
        c-4_\cerrar e-3 d-4 f-2 e-3 g-2 f-3 d-4

        \break

        % Steps Down
        g-5_\abrir e-3 f-2 d-4 e-3 c-5 d-4 f-3
        g-2_\cerrar e-3 f-2 d-3 e-2 c-4 d-3 f-2

        % Arp step down
        c-4_\abrir e-3 g-5 f-2 e-3 f-2 d-4 e-3
        c-4_\cerrar e-3 g-2 f-3 e-4 f-2 d-4 e-3

        \break

        % Jump step down
        c-4_\abrir g'-5 f-2 e-3 d-4 f-2 e-3 d-4
        c-3_\cerrar g'-2 f-3 e-4 d-3 f-2 e-3 d-4

        % Cadence
        e-4_\abrir g-5 e-3 c-4 d-3 g-5 f-2 d-3
        c-4_\cerrar g'-2 e-3 g-2 c,2-3 r2

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
