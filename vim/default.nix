{
  imports = [
    ./autocomplete.nix
    ./comment.nix
    ./debugger.nix
    ./filetree.nix
    ./filetypes.nix
    ./git.nix
    ./languages.nix
    ./lsp.nix
    ./lspconfig.nix
    ./theme.nix
    ./treesitter.nix
    ./ui.nix
    ./utility.nix
    ./visual.nix
  ];

  config.vim = {
    enableLuaLoader = true;
    syntaxHighlighting = true;
    lineNumberMode = "number";
    useSystemClipboard = true;
    viAlias = true;
    vimAlias = true;
    preventJunkFiles = true;

    #autopairs.enable = true;
    undoFile.enable = true;
    notify.nvim-notify.enable = true;
    presence.neocord.enable = true;
    projects.project-nvim.enable = true;
    #snippets.vsnip.enable = true;
    telescope.enable = true;
    globals.editorconfig = true;

    options = {
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;

      autoindent = true;
    };

    binds = {
      cheatsheet.enable = true;
      whichKey.enable = true;
    };

    dashboard = {
      dashboard-nvim.enable = false;
      alpha.enable = true;
    };

    statusline.lualine = {
      enable = true;
      globalStatus = true;
      icons.enable = true;
    };

    tabline.nvimBufferline = {
      enable = true;

      mappings = {
        cycleNext = "<leader>e";
        cyclePrevious = "<leader>q";
      };
    };

    terminal.toggleterm = {
      enable = true;
      lazygit.enable = true;
    };
  };
}
