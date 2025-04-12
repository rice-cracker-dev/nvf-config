{
  lib,
  pkgs,
  ...
}: {
  config.vim.formatter.conform-nvim.setupOpts = {
    formatters.biome.command = lib.getExe pkgs.biome;

    formatters_by_ft = {
      javascript = ["biome"];
      javascriptreact = ["biome"];
      typescript = ["biome"];
      typescriptreact = ["biome"];
      json = ["biome"];
      jsonc = ["biome"];
      json5 = ["biome"];
      vue = ["biome"];
      svelte = ["biome"];
      astro = ["biome"];
      css = ["biome"];
      yaml = ["biome"];
      graphql = ["biome"];
    };
  };
}
