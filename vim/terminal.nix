{
  config.vim = {
    terminal.toggleterm = {
      enable = true;
      lazygit.enable = true;
      setupOpts = {
        direction = "float";
      };
    };

    keymaps = [
      {
        key = "<esc>";
        mode = "t";
        action = "<C-\\><C-n>";
        noremap = false;
      }
    ];
  };
}
