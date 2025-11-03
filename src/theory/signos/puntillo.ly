common = {
    \omit Staff.Clef
    \omit Staff.TimeSignature
    \cadenzaOn
}

\score {
    <<
        \new Staff <<
            \common

            \new Voice \relative c'' {
                \stemUp

                c1. \bar "|"
                c2. \bar "|"
                c4. \bar "|"
                c8. \bar "|"
                c16. \bar "|"
                c32. \bar "||"

                c2.. \bar "|"
                c4.. \bar "|"
            }

            \new Voice \relative c' {
                \stemDown

                f1~ 2 \bar "|"
                f2~ 4 \bar "|"
                f4~ 8 \bar "|"
                f8~ 16 \bar "|"
                f16~ 32 \bar "|"
                f32~ 64 \bar "||"

                f2~ 4~ 8 \bar "|"
                f4~ 8~ 16 \bar "|"
            }
        >>
        \new Staff <<
            \common

            \new Voice \relative c'' {
                r1. \bar "|"
                r2. \bar "|"
                f4.\rest \bar "|"
                f8.\rest \bar "|"
                f16.\rest \bar "|"
                g32.\rest \bar "||"

                r2.. \bar "|"
                f4..\rest \bar "|"
            }

            \new Voice \relative c' {
                e1\rest e2\rest \bar "|"
                e2\rest e4\rest \bar "|"
                e4\rest e8\rest \bar "|"
                e8\rest e16\rest \bar "|"
                d16\rest d32\rest \bar "|"
                d32\rest d64\rest \bar "||"

                e2\rest e4\rest e8\rest \bar "|"
                e4\rest e8\rest e16\rest \bar "|"
            }
        >>
    >>
}
