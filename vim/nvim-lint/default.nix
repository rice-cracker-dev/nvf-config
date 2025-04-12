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
    autocmds = [{
      group = "nvf-config-lint";
      event = ["BufEnter" "BufWritePost" "InsertLeave"];
      callback = mkLuaInline ''
        function(args)
          local ft = vim.api.nvim_get_option_value("filetype", { buf = args.buf })
          local linters = require("lint").linters
          local linters_from_ft = require("lint").linters_by_ft[ft]
          
          -- if no linter is configured for this filetype, stops linting
          if linters_from_ft == nil then return end
          
          for _, name in ipairs(linters_from_ft) do
            local cwd = linters[name].required_files
            
            -- if no configuration files are configured, lint
            if cwd == nil then
              require("lint").try_lint(name)
            else
              -- if configuration files are configured and present in the project, lint
              for _, fn in ipairs(cwd) do
                if vim.uv.fs_stat(fn) then
                  require("lint").try_lint(name)
                end
              end
            end
          end
        end
      '';
    }];
  };
}
