\score {
    \new Staff \relative c {
        \clef bass

        \omit Staff.TimeSignature
        \omit Staff.KeySignature
        \omit BarNumber
        \cadenzaOn
        \autoLineBreaksOff
        \accidentalStyle forget

        bis   \harmonic  c    deses \harmonic \bar "|"
        cis   \harmonic  des                  \bar "|"
        cisis \harmonic  d    eeses \harmonic \bar "|"
        dis   \harmonic  ees                  \bar "|"
        disis \harmonic  e    feses \harmonic \bar "|"
        eis   \harmonic  f    geses \harmonic \bar "|"
        fis   \harmonic  ges                  \bar "|"

        \break

        fis   \harmonic  g    aeses \harmonic \bar "|"
        gis   \harmonic  aes                  \bar "|"
        gisis \harmonic  a    beses \harmonic \bar "|"
        ais   \harmonic  bes                  \bar "|"
        aisis \harmonic  b    ces   \harmonic \bar "|"
        bis   \harmonic  c    deses \harmonic \bar "|"

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
