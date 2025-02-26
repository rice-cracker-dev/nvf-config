{
  config.vim.languages = {
    enableDAP = true;
    enableExtraDiagnostics = true;
    enableFormat = true;
    enableLSP = true;
    enableTreesitter = true;

    # langauges
    astro = {
      enable = true;
      extraDiagnostics.enable = true;
      format.enable = true;
      lsp.enable = true;
      treesitter.enable = true;
    };

    bash = {
      enable = true;
      extraDiagnostics.enable = true;
      format.enable = true;
      lsp.enable = true;
      treesitter.enable = true;
    };

    clang = {
      enable = true;
      cHeader = true;
      dap.enable = true;
      lsp.enable = true;
      treesitter.enable = true;
    };

    css = {
      enable = true;
      format.enable = true;
      format.type = "prettierd";
      lsp.enable = true;
      treesitter.enable = true;
    };

    html = {
      enable = true;
      treesitter.enable = true;
      treesitter.autotagHtml = true;
    };

    lua = {
      enable = true;
      lsp.enable = true;
      lsp.lazydev.enable = true;
      treesitter.enable = true;
    };

    markdown = {
      enable = true;
      format.enable = true;
      lsp.enable = true;
      treesitter.enable = true;
    };

    nix = {
      enable = true;
      extraDiagnostics.enable = true;
      format.enable = true;
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

    rust = {
      enable = true;
      dap.enable = true;
      format.enable = true;
      lsp.enable = true;
      treesitter.enable = true;

      crates = {
        enable = true;
        codeActions = true;
      };
    };

    sql = {
      enable = true;
      extraDiagnostics.enable = true;
      format.enable = true;
      lsp.enable = true;
      treesitter.enable = true;
    };

    svelte = {
      enable = true;
      extraDiagnostics.enable = true;
      format.enable = true;
      lsp.enable = true;
      treesitter.enable = true;
    };

    tailwind = {
      enable = true;
      lsp.enable = true;
    };

    ts = {
      enable = true;
      extensions.ts-error-translator.enable = true;
      extraDiagnostics.enable = true;
      format.enable = true;
      format.type = "prettierd";
      lsp.enable = true;
      treesitter.enable = true;
    };
  };
}
