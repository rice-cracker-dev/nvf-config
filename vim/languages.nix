{config, ...}: {
  config.vim.languages = {
    # languages
    astro = {
      enable = true;
      extraDiagnostics.enable = false; # refers to vim/nvim-lint/linters
      format.enable = false;
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
      lsp.enable = true;
      treesitter.enable = true;
      format.enable = false;
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
      lsp.enable = true;
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
      extraDiagnostics.enable = false; # refers to vim/nvim-lint/linters
      format.enable = false;
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
      extraDiagnostics.enable = false; # refers to vim/nvim-lint/linters
      format.enable = false;
      lsp.enable = true;
      treesitter.enable = true;
    };

    typst = {
      enable = true;
      extensions.typst-preview-nvim.enable = true;
      format.enable = true;
      lsp.enable = true;
      treesitter.enable = true;
    };
  };
}
