{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nvf.url = "github:NotAShelf/nvf";

    # plugins
    ts-error-translator = {
      url = "github:dmmulroy/ts-error-translator.nvim";
      flake = false;
    };
  };

  outputs = {
    flake-parts,
    ts-error-translator,
    nvf,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        # only tested on x86_64-linux, if other platforms work, please send a PR
        "x86_64-linux"
      ];

      perSystem = {pkgs, ...}: let
        customNeovim = nvf.lib.neovimConfiguration {
          inherit pkgs;
          modules = [./configuration.nix];
          extraSpecialArgs = {
            inherit ts-error-translator;
          };
        };
      in {
        packages.default = customNeovim.neovim;
        formatter = pkgs.alejandra;
      };
    };
}
