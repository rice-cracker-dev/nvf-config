{
  config,
  lib,
  ...
}: let
  inherit (lib.generators) mkLuaInline;
  inherit (lib.nvim.lua) toLuaObject;
  inherit (lib.nvim.dag) entryBefore;

  cfg = config.vim.diagnostics.nvim-lint;
in {
  config.vim = {
    diagnostics.nvim-lint = {
      enable = true;
      lint_after_save = false;
    };

    luaConfigRC.nvf-config-nvim-lint = entryBefore ["autocmds"] ''
      local linters_cwd = ${toLuaObject cfg.linters_cwd};
    '';

    augroups = [{name = "nvf-config-nvim-lint";}];
    autocmds = [
      {
        group = "nvf-config-nvim-lint";
        event = ["BufEnter" "BufWritePost" "InsertLeave"];
        callback = mkLuaInline ''
          function(args)
            local lint = require("lint")
            local ft = vim.api.nvim_get_option_value("filetype", { buf = args.buf })
            local linters = lint.linters_by_ft[ft]

            -- if no linter is configured for this filetype, stops linting
            if linters == nil then return end

            for _, linter in ipairs(linters) do
              local cwd = linters_cwd[linter]

              -- if no configuration files are configured, lint
              if cwd == nil then
                lint.try_lint()
                return
              end

              -- if configuration files are configured and present in the project, lint
              for _, fn in ipairs(cwd) do
                if vim.uv.fs_stat(fn) then
                  lint.try_lint()
                  return
                end
              end
            end
          end
        '';
      }
    ];
  };
}
