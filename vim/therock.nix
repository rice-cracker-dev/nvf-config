{
  pkgs,
  lib,
  ...
}: let
  inherit (lib.generators) mkLuaInline;
  inherit (lib.nvim.lua) toLuaObject;
in {
  config.vim = {
    overseer.templates = [
      {
        name = "vine_boom";
        builder = mkLuaInline ''
          function()
            return {
              cmd = {${toLuaObject "${pkgs.ffmpeg}/bin/ffplay"}},
              args = {${toLuaObject ../assets/vine-boom.mp3}, "-autoexit", "-nodisp"},
            }
          end
        '';
      }
    ];

    autocmds = [
      {
        event = ["DiagnosticChanged"];
        callback = mkLuaInline ''
          function(args)
            local diagnostics = vim.diagnostic.get(args.buf, { severity = vim.diagnostic.severity.ERROR })
            if #diagnostics > 0 and vim.api.nvim_get_mode().mode == "n" then
              require("overseer").run_template({ name = "vine_boom" })
            end
          end
        '';
      }
    ];
  };
}
