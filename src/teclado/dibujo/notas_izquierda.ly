abrir = #(define-music-function () () #{
    ^\markup \text "A"
#})
cerrar = #(define-music-function () () #{
    ^\markup \text "C"
#})

\score {
    \relative c, {
        \clef bass
        \omit Staff.TimeSignature
        \cadenzaOn

        c \abrir \bar "|"
        cis \cerrar des \bar "|"
        d \bar "|"
        dis \abrir ees \bar "|"
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
        g \bar "|"
        gis aes \bar "|"
        a \abrir \bar "|"
        b \cerrar \bar "|"
    }

    % Fill all available space
    \layout {
        ragged-right = ##f
        ragged-last = ##f
    }
}
