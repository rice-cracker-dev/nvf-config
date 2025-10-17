{lib, ...}: let
  inherit (lib.generators) mkLuaInline;
in {
  imports = [./linters];

  config.vim = {
    diagnostics.nvim-lint = {
      enable = true;

      lint_function = mkLuaInline ''
        function(buf)
          local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })
          local linters = require("lint").linters
          local linters_from_ft = require("lint").linters_by_ft[ft]

          -- if no linter is configured for this filetype, stops linting
          if linters_from_ft == nil then return end

          for _, name in ipairs(linters_from_ft) do
            local linter = linters[name]
            assert(linter, 'Linter with name `' .. name .. '` not available')

            if type(linter) == "function" then
              linter = linter()
            end
            -- for require("lint").lint() to work, linter.name must be set
            linter.name = linter.name or name
            local cwd = linter.required_files

            -- if no configuration files are configured, lint
            if cwd == nil then
              require("lint").lint(linter)
            else
              -- if configuration files are configured and present
              -- in the current or parent directories, lint
              -- with cwd set to the file's directory
              local paths = vim.fs.find(cwd, { type = "file", upward = true })

              if #paths > 0 then
                require("lint").lint(linter, { cwd = vim.fs.dirname(paths[1]) })
              end
            end
          end
        end
      '';
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
