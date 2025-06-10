{
  imports = [
    ./jsonls.nix
    ./qmlls.nix
  ];

  config.vim.lsp = {
    enable = true;
    formatOnSave = true;

    lightbulb.enable = false;
    lspconfig.enable = true;
    nvim-docs-view.enable = true;
    trouble.enable = true;
  };
}
