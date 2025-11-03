\score{
    <<
        \new Voice = "notas" \relative c'' {
            \omit Staff.TimeSignature
            \time 2/4

            \override Lyrics.LyricSpace.minimum-distance = #2

            cis4 des |
            fis ges |
            bis, c |
            fes e |
            fisis g |
            beses, a \bar "||"
        }
        \new Lyrics \lyricsto "notas" {
            \lyricmode {
                DO_♯ RE_♭
                FA_♯ SOL_♭
                SI_♯ DO
                FA_♭ MI
                FA_𝄪 SOL
                SI_𝄫 LA
            }
        }
    >>
}
