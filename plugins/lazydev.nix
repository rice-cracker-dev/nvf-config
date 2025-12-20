{pkgs, ...}: {
  vim.lazy.plugins.${pkgs.vimPlugins.lazydev-nvim.pname} = {
    package = pkgs.vimPlugins.lazydev-nvim;
    ft = "lua";
    setupModule = "lazydev";
    setupOpts = {
      library = [
        {
          path = "\${3rd}/luv/library";
          words = ["vim%.uv"];
        }
      ];

      integrations.lspconfig = true;
    };
  };
}
