{lib, ...}: let
  inherit (lib.lists) concatMap;
in {
  imports = [
    ./conform
    ./languages
    ./nvim-dap
    ./nvim-lint
    ./autocomplete.nix
    ./comment.nix
    ./diagnostics.nix
    ./filetypes.nix
    ./git.nix
    ./tabline.nix
    ./telescope.nix
    ./terminal.nix
    ./treesitter.nix
    ./ui.nix
    ./utility.nix
    ./visual.nix
  ];

  config.vim = {
    enableLuaLoader = true;
    syntaxHighlighting = true;
    lineNumberMode = "relNumber";
    viAlias = true;
    vimAlias = true;
    preventJunkFiles = true;

    undoFile.enable = true;
    notify.nvim-notify.enable = true;
    presence.neocord.enable = true;
    projects.project-nvim.enable = true;
    globals.editorconfig = true;

    options = {
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      exrc = true;
      secure = true;
      mouse = "";
      winborder = "solid";
      ignorecase = true;
    };

    keymaps = concatMap (mode: let
      mkKey = key: {
        inherit mode key;
        action = "<Nop>";
        noremap = true;
      };
    in [
      (mkKey "<Up>")
      (mkKey "<Down>")
      (mkKey "<Left>")
      (mkKey "<Right>")
    ]) ["n" "i"];

    clipboard = {
      enable = true;
      providers.wl-copy.enable = true;
      registers = "unnamedplus";
    };

    autopairs.nvim-autopairs = {
      enable = true;
    };

    binds = {
      cheatsheet.enable = true;
      whichKey.enable = true;
    };

    dashboard = {
      dashboard-nvim.enable = false;
      alpha.enable = false;
    };

    statusline.lualine = {
      enable = true;
      globalStatus = true;
      icons.enable = true;

      activeSection.x = [
        ''
          {
            function()
              return require('direnv').statusline()
            end,
            'encoding',
            'fileformat',
            'filetype',
          }
        ''
      ];
    };
  };
}
