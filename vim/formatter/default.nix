{
  imports = [
    ./alejandra.nix
    #./biome.nix
    ./prettierd.nix
  ];

  config.vim.formatter.conform-nvim = {
    enable = true;

    setupOpts.format_after_save = null;
    setupOpts.format_on_save = null;
  };
}
