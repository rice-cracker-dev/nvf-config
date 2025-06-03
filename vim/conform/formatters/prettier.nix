{
  lib,
  pkgs,
  ...
}: {
  config.vim.formatter.conform-nvim.setupOpts = {
    formatters.prettier.command = lib.getExe pkgs.nodePackages.prettier;

    formatters_by_ft = {
      javascript = ["prettier"];
      javascriptreact = ["prettier"];
      typescript = ["prettier"];
      typescriptreact = ["prettier"];
      json = ["prettier"];
      jsonc = ["prettier"];
      json5 = ["prettier"];
      html = ["prettier"];
      vue = ["prettier"];
      svelte = ["prettier"];
      astro = ["prettier"];
      css = ["prettier"];
      scss = ["prettier"];
      less = ["prettier"];
      yaml = ["prettier"];
      markdown = ["prettier"];
      graphql = ["prettier"];
    };
  };
}
