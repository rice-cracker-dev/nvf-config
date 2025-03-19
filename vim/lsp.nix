{
  config.vim.lsp = {
    enable = true;
    formatOnSave = false;

    lightbulb.enable = false;
    lspconfig.enable = true;
    lsplines.enable = true;
    nvim-docs-view.enable = true;
    trouble.enable = true;

    lspsaga = {
      enable = true;
      setupOpts = {
        ui = {
          code_action = "󰌵";
        };
        lightbulb = {
          virtual_text = false;
        };
      };
    };
  };

  config.vim.keymaps = [
    {
      key = "<leader>ca";
      mode = "n";
      action = ":Lspsaga code_action<CR>";
      desc = "Code action [LSPSaga]";
    }
    {
      key = "<leader>cf";
      mode = "n";
      action = ":Lspsaga finder<CR>";
      desc = "Finder [LSPSaga]";
    }
    {
      key = "<leader>ch";
      mode = "n";
      action = ":Lspsaga hover_doc<CR>";
      desc = "Hover [LSPSaga]";
    }
    {
      key = "<leader>cd";
      mode = "n";
      action = ":Lspsaga peek_definition<CR>";
      desc = "Peek definition [LSPSaga]";
    }
    {
      key = "<leader>cr";
      mode = "n";
      action = ":Lspsaga rename<CR>";
      desc = "Rename [LSPSaga]";
    }
  ];
}
