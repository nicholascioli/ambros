\score {
    <<
        \new Voice = "notas" {
            \clef bass

            \omit Staff.TimeSignature
            \omit Staff.KeySignature
            \cadenzaOn
            \autoLineBreaksOff

            \relative c, {
                dis ees \bar "|"
                fis ges \bar "|"
                gis aes \bar "|"
                ais bes \bar "|"

                cis des \bar "|"
                dis ees \bar "|"
                fis ges \bar "|"
                gis aes \bar "|"
                ais bes \bar "|"

                cis des \bar "|"
                dis ees \bar "|"
                fis ges \bar "|"
                gis aes \bar "|"
            }

            \bar "||"
        }

        \new Lyrics {
            \lyricmode {
                Re♯ Mi♭
                Fa♯ Sol♭
                Sol♯ La♭
                La♯ Si♭

                Do♯ Re♭
                Re♯ Mi♭
                Fa♯ Sol♭
                Sol♯ La♭
                La♯ Si♭

                Do♯ Re♭
                Re♯ Mi♭
                Fa♯ Sol♭
                Sol♯ La♭
            }
        }
    >>

    \layout {
        ragged-right = ##f
        ragged-last = ##f
    }
}
