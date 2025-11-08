common = {
    \omit Staff.Clef
    \omit Staff.TimeSignature
}

\score {
    \header {
        piece = "Redonda vale"
    }
    <<
        \new Staff \with { instrumentName = "1" } \relative c'' { \common c1 }
        \new Staff \with { instrumentName = "2" } \relative c'' { \common c2 c2 }
        \new Staff \with { instrumentName = "4" } \relative c'' { \common c4 c4 c4 c4 }
        \new Staff \with { instrumentName = "8" } \relative c'' {
            \common \autoBeamOff
            c8 c

            \autoBeamOn
            \repeat unfold 6 { c }
        }
        \new Staff \with { instrumentName = "12" } \relative c'' {
            \common

            % Show the bracket on the first one with text
            \override TupletBracket.bracket-visibility = ##t
            \tupletUp \tuplet 3/2 { c8 ^\markup { "Tresillos" } c c }

            % Show the rest normally
            \omit TupletBracket
            \repeat unfold 3 { \tuplet 3/2 { c8 c c } }
        }
        \new Staff \with { instrumentName = "16" } \relative c'' {
            \common \autoBeamOff
            c16 c

            \autoBeamOn
            \repeat unfold 14 { c }
        }
        \new Staff \with { instrumentName = "32" } \relative c'' {
            \common \autoBeamOff
            c32 c

            \autoBeamOn
            c[ c ]
            c[ c c c ]

            \set subdivideBeams = ##t
            \set baseMoment = #(ly:make-moment 1/8)
            \set beatStructure = 2,2,2,2
            \repeat unfold 3 { c[ c c c c c c c ] }
        }
        \new Staff \with { instrumentName = "64" } \relative c'' {
            \common \autoBeamOff
            c64 c

            \autoBeamOn
            c[ c ]
            c[ c c c ]
            c[ c c c c c c c ]

            \set subdivideBeams = ##t
            \set baseMoment = #(ly:make-moment 1/8)
            \set beatStructure = 2,2,2,2
            \repeat unfold 3 { c[ c c c c c c c c c c c c c c c ] }
        }
    >>

    % Fill all available space
    \layout {
        ragged-right = ##f
        ragged-last = ##f
    }
}
