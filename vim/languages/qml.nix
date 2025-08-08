{
  pkgs,
  lib,
  ...
}: let
  inherit (lib.generators) mkLuaInline;
in {
  config.vim = {
    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      qmljs
    ];

    lsp.servers.qmlls = {
      capabilities = mkLuaInline "capabilities";
      on_attach = mkLuaInline "attach_keymaps";
      cmd = ["${pkgs.kdePackages.qtdeclarative}/bin/qmlls" "-E"];
    };

    # force restart the lsp on failure (it does that alot)
    autocmds = [
      {
        event = ["LspDetach"];
        callback = mkLuaInline ''
          function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)

            if client.name == "qmlls" then
              vim.lsp.start(vim.lsp.config.qmlls)
            end
          end
        '';
      }
    ];
  };
}
