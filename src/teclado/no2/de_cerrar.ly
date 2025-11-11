\score {
    <<
        \new Voice = "notas" {
            \clef treble

            \omit Staff.TimeSignature
            \omit Staff.KeySignature
            \cadenzaOn
            \autoLineBreaksOff

            \relative c' {
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

        \context {
            \Score
            \override LyricText #'font-size = #-1
        }
    }
}
