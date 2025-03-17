{
  config.vim.lsp = {
    enable = true;
    formatOnSave = false;

    lightbulb.enable = true;
    lspconfig.enable = true;
    lsplines.enable = true;
    nvim-docs-view.enable = true;
    trouble.enable = true;

    lspsaga = {
      enable = true;
      setupOpts = {
        ui = {
          code_action = "󰌵";
        };
      };
    };
  };
}
