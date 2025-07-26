{pkgs, ...}: {
  config.vim = {
    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      typescript
      javascript
      jsdoc
    ];

    lsp.servers.ts_ls = {
      cmd = ["${pkgs.typescript-language-server}/bin/typescript-language-server" "--stdio"];
    };
  };
}
