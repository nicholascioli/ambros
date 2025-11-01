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
        inherit (pkgs.texlive) scheme-minimal latex-bin latexmk titling;
      };
    in {
      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          lilypond
          tex
        ];
      };
    });
}
