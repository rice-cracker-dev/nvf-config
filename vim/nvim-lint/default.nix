{lib, ...}: let
  inherit (lib.generators) mkLuaInline;
in {
  imports = [./linters];

  config.vim = {
    diagnostics.nvim-lint = {
      enable = true;
      lint_after_save = false; # use my own implementation until upstream improves
    };

    augroups = [{name = "nvf-config-lint";}];
    autocmds = [
      {
        group = "nvf-config-lint";
        event = ["BufEnter" "BufWritePost" "InsertLeave"];
        callback = mkLuaInline ''
          function(args)
            nvf_lint(args.buf)
          end
        '';
      }
    ];
  };
}
