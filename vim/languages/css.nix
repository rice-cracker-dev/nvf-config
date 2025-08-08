{
  pkgs,
  lib,
  ...
}: let
  inherit (lib.generators) mkLuaInline;
in {
  config.vim = {
    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      css
      scss
    ];

    lsp.servers = {
      cssls = {
        capabilities = mkLuaInline "capabilities";
        on_attach = mkLuaInline "default_on_attach";
        cmd = ["${pkgs.vscode-css-languageserver}/bin/vscode-css-languageserver" "--stdio"];
        root_dir =
          mkLuaInline
          # lua
          ''
            function(bufnr, on_dir)
              local packagejson = vim.fs.find("package.json", { type = "file", upward = true })[1]

              if packagejson ~= nil then
                for line in io.lines(packagejson) do
                  if line:find("tailwindcss") then
                    return
                  end
                end
              end

              on_dir(vim.fn.getcwd())
            end
          '';
      };

      tailwindcss = {
        capabilities = mkLuaInline "capabilities";
        on_attach = mkLuaInline "default_on_attach";
        cmd = ["${pkgs.tailwindcss-language-server}/bin/tailwindcss-language-server" "--stdio"];
      };
    };
  };
}
