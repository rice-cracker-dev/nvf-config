{pkgs, ...}: let
  inherit (pkgs.vimPlugins) copilot-lua blink-copilot;
in {
  config.vim = {
    lazy.plugins = {
      "copilot.lua" = {
        cmd = ["Copilot"];
        event = "InsertEnter";
        package = copilot-lua;
        setupModule = "copilot";
        setupOpts = {
          suggestion = {enabled = false;};
          panel = {enabled = false;};

          copilot_node_command = "${pkgs.nodejs}/bin/node";
        };
      };
    };

    extraPlugins = {
      blink-copilot = {
        package = blink-copilot;
      };
    };
  };
}
