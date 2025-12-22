\score {
    \new Staff {
        \clef bass

        \omit Staff.TimeSignature
        \omit Staff.KeySignature
        \omit BarNumber
        \time 2/4
        \autoLineBreaksOff


        c,   f,  \harmonic
        d,   e,  \harmonic
        ees, des,\harmonic
        e,   d,  \harmonic
        f,   f   \harmonic % TODO: Actually look at this
        ges, b,  \harmonic
        g,   ges \harmonic
        aes, aes,\harmonic
        a,   d   \harmonic
        bes, bes,\harmonic
        b,   e,  \harmonic
        c    f'  \harmonic
        des  ees \harmonic
        d    g,  \harmonic
        ees  c'  \harmonic
        e    a,  \harmonic

        \break

        f    ees'\harmonic
        ges  f   \harmonic
        g    bes \harmonic
        aes  e   \harmonic
        a    g   \harmonic
        bes  c   \harmonic
        b    a   \harmonic
        c'   b   \harmonic
        des' aes \harmonic
        d'   des'\harmonic
        ees' b'  \harmonic
        e'   d'  \harmonic
        f'   des \harmonic
        ges' e'  \harmonic
        g'   ges'\harmonic
        aes' g'  \harmonic
        a'   aes'\harmonic

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
