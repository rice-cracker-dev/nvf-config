{pkgs, ...}: {
  config.vim = {
    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      svelte
    ];

    lsp.servers.svelte = {
      cmd = ["${pkgs.svelte-language-server}/bin/svelteserver" "--stdio"];
    };
  };
}
