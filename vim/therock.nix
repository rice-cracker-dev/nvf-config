{
  pkgs,
  lib,
  ...
}: let
  inherit (lib.generators) mkLuaInline;
  inherit (lib.nvim.lua) toLuaObject;
in {
  config.vim.overseer.templates = [
    {
      name = "vine_boom";
      builder = mkLuaInline ''
        function()
          return {
            cmd = {${toLuaObject "${pkgs.ffmpeg}/bin/ffplay"}},
            args = {${toLuaObject ../assets/vine-boom.mp3}},
          }
        end
      '';
    }
  ];
}
