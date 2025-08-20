{
  config.vim.languages = {
    lua = {
      enable = true;
      lsp.enable = true;
      lsp.lazydev.enable = true;
      treesitter.enable = true;
    };

    nix = {
      enable = true;
      extraDiagnostics.enable = true;
      lsp.enable = true;
      treesitter.enable = true;
    };

    python = {
      enable = true;
      dap.enable = true;
      format.enable = true;
      lsp.enable = true;
      treesitter.enable = true;
    };
  };
}
