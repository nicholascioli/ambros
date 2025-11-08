abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \relative c' {
        \clef treble
        \omit Staff.TimeSignature
        \cadenzaOn

        a \bar "|"
        ais bes \bar "|"
        b \bar "|"
        c \bar "|"
        cis des \bar "|"
        d \bar "|"
        dis ees \bar "|"
        e \bar "|"
        f \bar "|"
        fis ges \bar "|"
        g \bar "|"
        gis aes \bar "|"

        a \bar "|"
        ais bes \bar "|"
        b \bar "|"
        c \bar "|"
        cis des \bar "|"
        d \bar "|"
        dis ees \bar "|"
        e \bar "|"
        f \bar "|"
        fis ges \bar "|"
        g \bar "|"
        gis aes \bar "|"

        a \bar "|"
        ais bes \bar "|"
        b \bar "|"
        c \bar "|"
        cis des \bar "|"
        d \bar "|"
        dis ees \bar "|"
        e \bar "|"
        f \bar "|"
        fis ges \bar "|"
        g \bar "|"
        gis aes \bar "|"
        a \bar "|"
        bes \abrir \bar "||"
    }

    % Fill all available space
    \layout {
        ragged-right = ##f
        ragged-last = ##f
    }
}
