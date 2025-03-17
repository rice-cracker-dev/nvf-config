{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:NotAShelf/nvf/1d7c27abd97f4532acd9710dd2d7db439ddfe69a";
  };

  outputs = {
    nixpkgs,
    nvf,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    configModule = import ./configuration.nix;

    customNeovim = nvf.lib.neovimConfiguration {
      modules = [configModule];
      inherit pkgs;
    };
  in {
    # this will make the package available as a flake input
    packages.${system}.default = customNeovim.neovim;
  };
}
