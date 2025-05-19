{
  imports = [./formatters];

  config.vim = {
    formatter.conform-nvim = {
      enable = true;
    };

    lsp.mappings.format = null;

    keymaps = [
      {
        key = "<leader>lf";
        mode = "n";
        lua = true;
        action = "function() require('conform').format() end";

        desc = "Format [Conform]";
      }
    ];
  };
}
