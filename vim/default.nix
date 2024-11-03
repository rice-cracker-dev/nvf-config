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

    autopairs.enable = true;
    telescope.enable = true;
    undoFile.enable = true;

    binds = {
      cheatsheet.enable = true;
      whichKey.enable = true;
    };

    dashboard = {
      dashboard-nvim.enable = false;
      alpha.enable = true;
    };
  };
}
