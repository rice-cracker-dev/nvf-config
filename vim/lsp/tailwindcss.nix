{pkgs, ...}: {
  config.vim.lsp.lspconfig.sources.tailwindcss = ''
    lspconfig.tailwindcss.setup {
      cmd = {"${pkgs.tailwindcss-language-server}/bin/tailwindcss-language-server", "--stdio"},
      settings = {
        includeLanguages = {
          svelte = "svelte",
          vue = "vue",
          astro = "astro"
        }
      }
    }
  '';
}
