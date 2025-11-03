\new Staff \relative {
    \cadenzaOn

    \omit Beam
    \omit Flag
    \omit Staff.TimeSignature
    \omit Staff.Clef
    \omit Stem

    <a'' c,,> ^\markup { "Lineas y espacios suplementarios" }
    <c a,,>
    <e f,,,>
    <g d,,,>
    <b b,,,,>
    \bar "|"

    <g, d,>
    <b b,,>
    <d g,,,>
    <f e,,,>
    <a c,,,,>
    \bar "|"
}
