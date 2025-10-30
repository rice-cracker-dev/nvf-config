{lib, ...}: let
  inherit (lib) mkForce;
  inherit (lib.generators) mkLuaInline;
in {
  config.vim.autocomplete.blink-cmp = {
    enable = true;

    setupOpts = {
      appearance = {
        nerd_font_variant = "normal";

        kind_icons = {
          Text = "";
          Method = "";
          Function = "";
          Constructor = "";

          Field = "";
          Variable = "";
          Property = "";

          Class = "";
          Interface = "";
          Struct = "";
          Module = "󰅩";

          Unit = "";
          Value = "";
          Enum = "";
          EnumMember = "";

          Keyword = "";
          Constant = "";

          Snippet = "";
          Color = "";
          File = "";
          Reference = "";
          Folder = "";
          Event = "";
          Operator = "";
          TypeParameter = "";
        };
      };

      completion = {
        list.selection = {
          preselect = false;
          auto_insert = false;
        };

        list.trigger = {
          show_on_insert = true;
          show_on_backspace = true;
          show_on_backspace_in_keyword = true;
        };

        menu.draw.columns = mkLuaInline ''
          { { 'kind_icon' }, { 'kind' }, { 'label', 'label_description', gap = 1 } }
        '';
      };

      sources = {
        default = mkForce [
          "lazydev"
          "lsp"
          "snippets"
          "buffer"
        ];

        providers = {
          lazydev = {
            name = "LazyDev";
            module = "lazydev.integrations.blink";
            score_offset = 100;
          };
        };
      };
    };
  };
}
