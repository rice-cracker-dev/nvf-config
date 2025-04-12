{
  imports = [./formatters];

  config.vim.formatter.conform-nvim = {
    enable = true;

    setupOpts.format_after_save = null;
    setupOpts.format_on_save = null;
  };
}
