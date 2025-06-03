{
  lib,
  pkgs,
  ...
}: {
  config.vim.formatter.conform-nvim.setupOpts = {
    formatters.prettierd.command = lib.getExe pkgs.prettierd;

    formatters_by_ft = {
      javascript = ["prettierd"];
      javascriptreact = ["prettierd"];
      typescript = ["prettierd"];
      typescriptreact = ["prettierd"];
      json = ["prettierd"];
      jsonc = ["prettierd"];
      json5 = ["prettierd"];
      html = ["prettierd"];
      vue = ["prettierd"];
      svelte = ["prettierd"];
      astro = ["prettierd"];
      css = ["prettierd"];
      scss = ["prettierd"];
      less = ["prettierd"];
      yaml = ["prettierd"];
      markdown = ["prettierd"];
      graphql = ["prettierd"];
    };
  };
}
