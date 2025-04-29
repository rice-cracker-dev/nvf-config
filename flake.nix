{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:NotAShelf/nvf";
    flake-utils = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    nvf,
    ...
  }: flake-utils.lib.eachDefaultSystem (system: let
    pkgs = nixpkgs.legacyPackages.${system};

    configModule = import ./configuration.nix;

    customNeovim = nvf.lib.neovimConfiguration {
      modules = [configModule];
      inherit pkgs;
    };
  in {
    # this will make the package available as a flake input
    packages.${system}.default = customNeovim.neovim;
  });
}
