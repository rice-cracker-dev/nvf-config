{
  config.vim.autocomplete = {
    enable = true;
    alwaysComplete = true;

    sources = {
      nvim_lsp = "[LSP]";
      path = "[Path]";
      buffer = "[Buffer]";
    };

    mappings = {
      close = "<C-e>"; # ctrl-e
      complete = "<C-Space>"; # ctrl-space
      confirm = "<CR>"; # return
      next = "<Tab>";
      previous = "<S-Tab>";
      scrollDocsDown = "<C-f>";
      scrollDocsUp = "<C-d>";
    };
  };
}
