{
  imports = [
    ./autocomplete.nix
    ./comment.nix
    ./debugger.nix
    ./filetree.nix
    ./git.nix
    ./languages.nix
    ./lsp.nix
    ./treesitter.nix
    ./ui.nix
    ./utility.nix
    ./visual.nix
  ];

  config.vim = {
    enableEditorconfig = true;
    enableLuaLoader = true;
    autoIndent = true;
    syntaxHighlighting = true;
    tabWidth = 2;
    lineNumberMode = "number";
    useSystemClipboard = true;
    viAlias = true;
    vimAlias = true;
    preventJunkFiles = true;

    autopairs.enable = true;
    undoFile.enable = true;
    notify.nvim-notify.enable = true;
    presence.neocord.enable = true;
    projects.project-nvim.enable = true;
    snippets.vsnip.enable = true;
    telescope.enable = true;

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
