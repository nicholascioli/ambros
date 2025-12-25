abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = "15."

        \new Staff \relative c'' {
            c4-4_\abrir d-3 e-5 f-2 g-5 f e d
            c-4_\cerrar d-5 e-3 f-2 e2-3 d-4
            c-4_\abrir r2 g'-5 r2
            c,2.-3_\cerrar f4-2 g2-5 c,-4
            d4-3_\abrir e-5 f-2 e d2 r2
            e4-3_\cerrar f-2 g-5 f-2 e2.-3 d4-4

            c-4_\abrir d-3 e-5 f g f e d
            c-3_\cerrar d-4 e-3 f-2 e-3 d-4 c2-3

            \fine
        }
        \new Staff \relative c' {
            \clef bass

            c2-4 r2 g'-5 r2
            c,-3 r2 e4-3 g-2 f g
            c,-5 d-4 e-3 f-2 g-5 f-2 e-4 d-5
            c-4 d-3 e-2 f-3 e d c2

            g'2-5 r2 g4-5 f-2 e-3 d-4
            % TODO: The first C below was blurry in the original scan
            c2-5 r2 c4-4 g'-2 e-3 g
            c,2-4 r2 g'-5 r2
            c,4-4 d-3 e-2 f-3 g2-2 c,-4


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
