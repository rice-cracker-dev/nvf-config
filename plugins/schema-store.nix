{pkgs, ...}: let
  inherit (pkgs.vimPlugins) SchemaStore-nvim;
in {
  config.vim.extraPlugins.schemastore = {
    package = SchemaStore-nvim;
  };
}
