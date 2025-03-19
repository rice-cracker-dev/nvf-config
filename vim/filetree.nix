{
  config.vim = {
    filetree.neo-tree = {
      enable = true;

      mappings = {
        toggle = "<C-n>";
      };

      setupOpts = {
        enable_cursor_hijack = true;
        enable_diagnostics = true;
        enable_git_status = true;
      };
    };
  };
}
