{
  ts-error-translator,
  pkgs,
  ...
}: let
  ts-error-translator-plugin = pkgs.vimUtils.buildVimPlugin {
    name = "ts-error-translator";
    src = ts-error-translator;
  };
in {
  config.vim.extraPlugins.ts-error-translator = {
    package = ts-error-translator-plugin;
    setup = "require('ts-error-translator').setup()";
  };
}
