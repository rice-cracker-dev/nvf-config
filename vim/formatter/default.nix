{
  imports = [
    ./alejandra.nix
    ./biome.nix
    ./prettierd.nix
  ];

  config.vim.formatter.conform-nvim = {
    enable = true;
  };
}
