{
  imports = [
    ./astro.nix
    ./bash.nix
    ./cpp.nix
    ./css.nix
    ./docker.nix
    ./gdscript.nix
    ./handlebars.nix
    ./html.nix
    ./json.nix
    ./lua.nix
    ./markdown.nix
    ./nix.nix
    ./python.nix
    ./qml.nix
    ./svelte.nix
    ./ts.nix
    ./yaml.nix
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
