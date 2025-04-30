{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:NotAShelf/nvf";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    nvf,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};

      configModule = import ./configuration.nix;

      customNeovim = nvf.lib.neovimConfiguration {
        modules = [configModule];
        inherit pkgs;
      };
    in {
      packages.default = customNeovim.neovim;
    });
}
