\new Staff {
    \omit Staff.TimeSignature
    \clef bass

    \override Score.BarLine.stencil = ##f
    \repeat unfold 2 { s1 }
    \revert Score.BarLine.stencil
}
