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

    direnv-nvim = {
      url = "github:NotAShelf/direnv.nvim";
      flake = false;
    };
  };

  outputs = {
    flake-parts,
    ts-error-translator,
    direnv-nvim,
    nvf,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        # only tested on x86_64-linux, if other platforms work, please send a PR
        # or open an issue
        "x86_64-linux"
      ];

      perSystem = {pkgs, ...}: let
        customNeovim = nvf.lib.neovimConfiguration {
          inherit pkgs;
          modules = [./configuration.nix];
          extraSpecialArgs = {
            inherit ts-error-translator direnv-nvim;
          };
        };
      in {
        packages.default = customNeovim.neovim;

        formatter = pkgs.writeShellApplication {
          name = "alejandra";
          runtimeInputs = [pkgs.alejandra];
          text = "alejandra .";
        };
      };
    };
}
