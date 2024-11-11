{pkgs, ...}: let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;

  projectconfig = buildVimPlugin {
    name = "nvim-projectconfig";
    src = fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-projectconfig";
      rev = "db11fd7d51f7180ede292a7584eb62bb48f91863";
      hash = "sha256-wIoUu7hxaWVR2zDqK02tYQ3rX4X2oqO0k8zXUSjOLzA=";
    };
  };
in {
  config.vim.extraPlugins.projectconfig = {
    package = projectconfig;
    setup = ''
      require('nvim-projectconfig').setup()
    '';
  };
}
