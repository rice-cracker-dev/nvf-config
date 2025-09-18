{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib) mkOption mkEnableOption;
  inherit (lib.strings) concatMapStringsSep;
  inherit (lib.types) listOf anything attrsOf str;
  inherit (lib.nvim.types) mkPluginSetupOption;
  inherit (lib.nvim.dag) entryAfter;
  inherit (lib.nvim.lua) toLuaObject;
  inherit (pkgs.vimPlugins) overseer-nvim;

  cfg = config.vim.overseer;
  templates = concatMapStringsSep "\n" (x: "overseer.register_template(${toLuaObject x})") cfg.templates;
in {
  options.vim.overseer = {
    setupOpts = mkPluginSetupOption "overseer" {
      templates = mkOption {
        type = listOf str;
        default = ["builtin"];
      };

      dap = mkEnableOption "nvim-dap support" // {default = true;};
    };

    templates = mkOption {
      type = listOf (attrsOf anything);
    };
  };

  config.vim.extraPlugins.overseer-nvim = {
    package = overseer-nvim;
    setup = ''require("overseer").setup(${toLuaObject config.vim.overseer.setupOpts})'';
  };

  config.vim.luaConfigRC.overseer-setup = entryAfter ["extraPluginConfigs"] ''
    local overseer = require("overseer")
    ${templates}
  '';
}
