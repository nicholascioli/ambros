\score {
    \new Staff \relative {
        \omit Staff.TimeSignature

        s1 | s1 | s1 |
        \repeat volta 2 { s1 | s1 }
        \repeat volta 2 { s1 | s1 }
    }

    % Fill all available space
    \layout {
        ragged-right = ##f
        ragged-last = ##f
    }
}
