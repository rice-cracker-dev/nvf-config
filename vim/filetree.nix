{
  config.vim = {
    filetree.neo-tree = {
      enable = true;

      setupOpts = {
        enable_cursor_hijack = true;
        enable_diagnostics = true;
        enable_git_status = true;

        default_component_configs = {
          indent = {
            with_expanders = true;
            expander_collapsed = "";
            expander_expanded = "";
            expander_highlight = "NeoTreeExpander";
          };
        };

        filesystem.filtered_items = {
          hide_dotfiles = false;
          hide_gitignored = false;
          hide_hidden = false;
          hide_by_name = [
            ".DS_Store"
            "thumbs.db"
            "node_modules"
            ".git"
          ];
        };
      };
    };

    keymaps = [
      {
        key = "<C-n>";
        mode = "n";
        action = ":Neotree toggle<CR>";
      }
    ];
  };
}
