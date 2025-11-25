{
  pkgs,
  lib,
  ...
}: let
  inherit (lib.generators) mkLuaInline;
in {
  config.vim = {
    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      typescript
      tsx
      javascript
      jsdoc
    ];

    lsp.servers.ts_ls = {
      capabilities = mkLuaInline "capabilities";
      on_attach = mkLuaInline "default_on_attach";
      cmd = ["${pkgs.typescript-language-server}/bin/typescript-language-server" "--stdio"];
      settings.preferences.quotePreference = "single";
    };

    luaConfigRC.tanstack_router_auto_reload = ''
      local routegen_path = vim.fs.joinpath(vim.fn.getcwd(), "src", "routeTree.gen.ts")

      if vim.uv.fs_stat(routegen_path) then
        vim.api.nvim_create_autocmd({'BufWritePost'}, {
          pattern = "*/src/routes/**",
          command = "silent! edit! src/routeTree.gen.ts",
        })
      end
    '';
  };
}
