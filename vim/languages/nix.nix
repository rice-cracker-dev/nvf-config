{
  pkgs,
  lib,
  ...
}: let
  inherit (lib.generators) mkLuaInline;
in {
  config.vim = {
    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      nix
    ];

    lsp.servers.nixd = {
      capabilities = mkLuaInline "capabilities";
      on_attach = mkLuaInline "default_on_attach";
      cmd = ["${pkgs.nixd}/bin/nixd"];
      settings.nixd.formatting.command = ["${pkgs.alejandra}/bin/alejandra" "--quiet"];
    };
  };
}
