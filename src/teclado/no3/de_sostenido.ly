\score {
    \new Staff \relative {
        \clef treble

        \omit Staff.TimeSignature
        \omit Staff.KeySignature
        \omit BarNumber
        \time 2/4
        \autoLineBreaksOff

        a    a   \harmonic
        ais  ais!\harmonic
        b    b   \harmonic
        c    d   \harmonic
        cis  c   \harmonic
        d    cis \harmonic
        dis  dis!\harmonic
        e    fis \harmonic
        f    f   \harmonic
        fis  g   \harmonic
        g    gis \harmonic
        gis  a   \harmonic

        a    b   \harmonic
        ais  e   \harmonic
        b'   cis \harmonic
        c    d   \harmonic
        cis  fis \harmonic
        d    e   \harmonic
        dis  e   \harmonic

        \break

        e    g   \harmonic
        f    f   \harmonic
        fis  gis \harmonic
        g    dis \harmonic
        gis  a   \harmonic
        a    b   \harmonic
        ais  ais,\harmonic
        b'   cis \harmonic
        c    c,  \harmonic
        cis' e   \harmonic
        d    d   \harmonic
        dis  dis!\harmonic
        e    c   \harmonic
        f    f   \harmonic
        fis  ais,\harmonic
        g'   fis \harmonic
        gis  gis!\harmonic

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
