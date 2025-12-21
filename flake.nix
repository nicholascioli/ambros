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

          buildInputs = [pkgs.coreutils pkgs.lilypond tex];
          phases = ["unpackPhase" "buildPhase" "installPhase"];

          buildPhase = ''
            export PATH="${pkgs.lib.makeBinPath buildInputs}";
            export HOME=$(mktemp -d)

            env \
              SOURCE_DATE_EPOCH=${toString self.lastModified} \
              \
              lualatex \
                -interaction=nonstopmode \
                -output-format=pdf \
                -shell-escape \
                $src/book.tex
          '';

          installPhase = ''
            mkdir -p $out
            cp book.pdf $out/
          '';
        };
      };
    });
}
