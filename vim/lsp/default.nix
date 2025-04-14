{
  imports = [
    ./emmet_ls.nix
    ./jsonls.nix
    ./qmlls.nix
  ];

  config.vim.lsp = {
    enable = true;
    formatOnSave = false;

    lightbulb.enable = false;
    lspconfig.enable = true;
    nvim-docs-view.enable = true;
    trouble.enable = true;
  };
}
