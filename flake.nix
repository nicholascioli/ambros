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
          
          caption
          fancyhdr
          footmisc
          import
          latex-bin
          lyluatex
          musicography
          parskip
          setspace
          titlesec
          titling
          # Needed by lyluatex
          
          minibox
          collection-luatex
          currfile
          environ
          filehook
          luaoptions
          luatexbase
          metalogo
          pdflscape
          pdfpages
          varwidth
          xkeyval
          # Needed by musicography
          
          musixtex-fonts
          stackengine
          # Needed by svg
          
          catchfile
          pgf
          svg
          transparent
          xcolor
          ;
      };
    in {
      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          inotify-tools
          lilypond
          tex

          # For scripts
          nodejs

          # For embedding SVGs into latex
          inkscape
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
              ./book.tex
              "src"
            ];
          };

          buildInputs = with pkgs;
            [
              coreutils
              inkscape
              lilypond
              ncurses
            ]
            ++ [tex];
          phases = ["unpackPhase" "buildPhase" "installPhase"];

          buildPhase = ''
            export PATH="${pkgs.lib.makeBinPath buildInputs}";
            export HOME=$(mktemp -d)

            cp -r $src build-src/
            chmod +w ./build-src/
            cd build-src/

            env \
              SOURCE_DATE_EPOCH=${toString self.lastModified} \
              \
              lualatex \
                -interaction=nonstopmode \
                -output-format=pdf \
                -shell-escape \
                book.tex
          '';

          installPhase = ''
            mkdir -p $out
            cp build-src/book.pdf $out/ambros-method.pdf
          '';
        };
      };
    });
}
