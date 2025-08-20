{
  config.vim.autocomplete.blink-cmp = {
    enable = true;

    setupOpts.sources = {
      default = [
        "lazydev"
        "lsp"
        "path"
        "snippets"
        "buffer"
      ];

      providers = {
        lazydev = {
          name = "LazyDev";
          module = "lazydev.integrations.blink";
          score_offset = 100;
        };
      };
    };
  };
}
