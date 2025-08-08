{
  imports = [
    ./astro.nix
    ./css.nix
    ./gdscript.nix
    ./json.nix
    ./qml.nix
    ./svelte.nix
    ./ts.nix
  ];

  config.vim.lsp = {
    enable = true;
    formatOnSave = true;
    inlayHints.enable = true;
    lightbulb.enable = false;
    lspconfig.enable = true;
    nvim-docs-view.enable = true;
    trouble.enable = true;
  };
}
