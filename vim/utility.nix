{
  config.vim.utility = {
    surround.enable = true;

    images.image-nvim = {
      enable = true;
      setupOpts.backend = "kitty";
    };

    yazi-nvim = {
      enable = true;
      mappings.yaziToggle = "<c-n>";
      setupOpts.open_for_directories = true;
    };
  };
}
