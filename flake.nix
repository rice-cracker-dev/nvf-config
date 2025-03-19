{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:NotAShelf/nvf/a5dee946a9eb749649d17a9d4cd78271600247d0";
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
