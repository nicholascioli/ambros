\score {
    <<
        \new Voice = "notas" \relative {
            \omit Staff.TimeSignature
            \time 1/4

            \autoBreaksOff
            \override Lyrics.LyricSpace.minimum-distance = #1.2
            e4 f g a b c d e f g a b c d e f g a b c d e f g a b
        }
        \new Lyrics \lyricsto "notas" {
            \lyricmode {
                MI FA SOL LA SI DO RE ME FA SOL LA SI DO RE ME FA SOL LA SI DO RE MI FA SOL LA SI
            }
        }
    >>
}

\score {
    <<
        \new Voice = "notas" \relative {
            \omit Staff.TimeSignature
            \clef bass
            \time 1/4

            \autoBreaksOff
            \override Lyrics.LyricSpace.minimum-distance = #1.2
            d,,4 e f g a b c d e f g a b c d e f g a b c d e f g a
        }
        \new Lyrics \lyricsto "notas" {
            \lyricmode {
                RE MI FA SOL LA SI DO RE ME FA SOL LA SI DO RE ME FA SOL LA SI DO RE MI FA SOL LA
            }
        }
    >>
}
