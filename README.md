# Ambros Method

This is a remaking of the Ambros Method guide for Bandoneón playing
originally written by Ricordi. It is written using a combination of LaTeX for
the text portions / layout and Lilypond for the sheet music.

The original title is *Método completo para el estudio del Bandoneón*.

## Building

This PDF can be built using nix. Run either of the commands below to build the
PDF:

```shell
# To build it without cloning
$ nix build github:nicholascioli/ambros

# To build it with a local clone
$ nix build path:.
```

## Automated Builds

Release PDFs are created whenever I feel like there has been enough progress
and / or corrections that warrant a release. Releases are based on the date they
are released.
