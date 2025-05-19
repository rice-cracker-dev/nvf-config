{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nvf.url = "github:NotAShelf/nvf";
  };

  outputs = {
    flake-parts,
    nvf,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        # only tested on x86_64-linux, if other platforms work, please send a PR
        "x86_64-linux"
      ];

      perSystem = {pkgs, ...}: let
        configModule = import ./configuration.nix;

        customNeovim = nvf.lib.neovimConfiguration {
          modules = [configModule];
          inherit pkgs;
        };
      in {
        packages.default = customNeovim.neovim;
        formatter = pkgs.alejandra;
      };
    };
}
