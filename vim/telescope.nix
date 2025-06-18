{pkgs, ...}: {
  config.vim.telescope = {
    enable = true;
    setupOpts = {
      defaults = {
        file_ignore_patterns = [
          "node_modules"
          ".git/"
          ".direnv/"
          ".svelte-kit/"
          "dist/"
          "build/"
          "target/"
          "result/"
        ];
      };

      pickers.find_files = {
        hidden = true;
        find_command = ["${pkgs.fd}/bin/fd" "--type=file" "--hidden"];
      };
    };
  };
}
