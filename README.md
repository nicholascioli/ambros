# Ambros Method

This is a remaking of the Ambros Method guide for Bandoneón playing
originally written by Ricordi. It is written using a combination of LaTeX for
the text portions / layout and Lilypond for the sheet music.

The original title is *Método completo para el estudio del Bandoneón*.

## Changes from the Original

### Note Numbers

The original document contained numeric markings in the form of fractions and
special symbols to help those that do not read sheet music understand the notes.
This has been removed as it was too much of a pain to preserve on every fingering
diagram.

### Fingering System

Fingering has been modified to fit the modern piano fingering system. The mapping
below explains the difference.

Original Fingering | Piano Fingering | Corresponding Finger
-------------------|-----------------|----------------------
1                  | 2               | Index Finger
2                  | 3               | Middle Finger
3                  | 4               | Ring Finger
4                  | 5               | Pinky


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
