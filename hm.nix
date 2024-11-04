{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkOption mkEnableOption;
  inherit (lib.types) attrsOf;
  inherit (inputs.nvf.lib.nvim) neovimConfiguration;
  inherit (inputs.nvf.lib.nvim.types) anythingConcatLists;

  cfg = config;
  nvfConfig = cfg.settings;
  configModule = import ./configuration.nix;

  neovimConfigured = neovimConfiguration {
    inherit pkgs;
    modules = [configModule nvfConfig];
  };
in {
  options = {
    enable = mkEnableOption "nvf-config";

    settings = mkOption {
      type = attrsOf anythingConcatLists;
      default = {};
    };
  };

  config = mkIf cfg.enable {
    home.packages = [neovimConfigured.neovim];
  };
}
