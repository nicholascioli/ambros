\score {
    \new Staff \relative {
        \clef treble

        \omit Staff.TimeSignature
        \omit Staff.KeySignature
        \omit BarNumber
        \time 2/4
        \autoLineBreaksOff

        a    a   \harmonic
        bes  bes!\harmonic
        b    b   \harmonic
        c    d   \harmonic
        des  c   \harmonic
        d    des \harmonic
        ees  ees!\harmonic
        e    ges \harmonic
        f    f   \harmonic
        ges  g   \harmonic
        g    aes \harmonic
        aes  a   \harmonic

        a    b   \harmonic
        bes  e,  \harmonic
        b'   des \harmonic
        c    d   \harmonic
        des  ges \harmonic
        d    e   \harmonic
        ees  e   \harmonic

        \break

        e    g   \harmonic
        f    f   \harmonic
        ges  aes \harmonic
        g    ees \harmonic
        aes  a   \harmonic
        a    b   \harmonic
        bes  bes,\harmonic
        b'   des \harmonic
        c    c,  \harmonic
        des' e   \harmonic
        d    d   \harmonic
        ees  ees!\harmonic
        e    c   \harmonic
        f    f   \harmonic
        ges  bes,\harmonic
        g'   ges \harmonic
        aes  aes!\harmonic

        a    g   \harmonic
        b    a   \harmonic

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
