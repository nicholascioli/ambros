\score {
    \new Staff \relative {
        \omit Staff.TimeSignature

        s1 | s1 | s1 |
        \repeat volta 2 { s1 | s1 }
        \repeat volta 2 { s1 | s1 }
    }
}
