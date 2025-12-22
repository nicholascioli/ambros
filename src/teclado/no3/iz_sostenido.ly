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
        dis, cis,\harmonic
        e,   d,  \harmonic
        f,   f   \harmonic % TODO: Actually look at this
        fis, b,  \harmonic
        g,   fis \harmonic
        gis, gis,\harmonic
        a,   d   \harmonic
        ais, ais,\harmonic
        b,   e,  \harmonic
        c    f'  \harmonic
        cis  dis \harmonic
        d    g,  \harmonic
        dis  c'  \harmonic
        e    a,  \harmonic

        \break

        f    dis'\harmonic
        fis  f   \harmonic
        g    ais \harmonic
        gis  e   \harmonic
        a    g   \harmonic
        ais  c   \harmonic
        b    a   \harmonic
        c'   b   \harmonic
        cis' gis \harmonic
        d'   cis'\harmonic
        dis' b'  \harmonic
        e'   d'  \harmonic
        f'   cis \harmonic
        fis' e'  \harmonic
        g'   fis'\harmonic
        gis' g'  \harmonic
        a'   gis'\harmonic

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
