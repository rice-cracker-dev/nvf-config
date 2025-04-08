{
  config.vim.diagnostics = {
    enable = true;

    config = {
      signs = {
        text = {
          "vim.diagnostic.severity.ERROR" = "󰅚 ";
          "vim.diagnostic.severity.WARN" = "󰀪 ";
        };
      };

      update_in_insert = true;
      virtual_lines = true;
    };

    nvim-lint.enable = true;
  };
}
