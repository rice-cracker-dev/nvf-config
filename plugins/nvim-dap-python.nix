{pkgs, ...}: let
  inherit (pkgs.vimPlugins) nvim-dap-python;
in {
  config.vim.extraPlugins.nvim-dap-python = {
    package = nvim-dap-python;
    setup = ''require("dap-python").setup("python3")'';
  };
}
