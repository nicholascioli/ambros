{
  description = "Ambros Bandoneon Method written as LaTeX with Lilypond";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";

    flake-utils.url = "github:numtide/flake-utils";
    nix-filter.url = "github:numtide/nix-filter";
  };

  outputs = {
    self,
    flake-utils,
    nix-filter,
    nixpkgs,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      filter = nix-filter.lib;

      tex = pkgs.texlive.combine {
        inherit
          (pkgs.texlive)
          scheme-basic
          # Packages below
          
          latex-bin
          titling
          ;
      };
    in {
      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          lilypond
          tex
        ];
      };

      packages = rec {
        default = book;

        book = pkgs.stdenvNoCC.mkDerivation rec {
          pname = "ambros-bandoneon-method";
          version = "0.0.1";

          # Only include latex and lilypond related files
          src = filter {
            root = self;
            include = [
              (filter.matchExt "ly")
              (filter.matchExt "lytex")
              (filter.matchExt "tex")
            ];
          };

          buildInputs = [pkgs.coreutils pkgs.lilypond tex];
          phases = ["unpackPhase" "buildPhase" "installPhase"];

          buildPhase = ''
            export PATH="${pkgs.lib.makeBinPath buildInputs}";

            # Build the sheet music with lilypond
            mkdir .out/
            lilypond-book \
              --output=.out \
              --pdf \
              $src/book.lytex

            # Make the PDF reproducible
            echo '\pdfvariable suppressoptionalinfo 512\relax' >> .out/book.tex

            # Compile the book
            env \
              SOURCE_DATE_EPOCH=${toString self.lastModified}
            \
            pdflatex .out/book
          '';

          installPhase = ''
            mkdir -p $out
            cp book.pdf $out/
          '';
        };
      };
    });
}
