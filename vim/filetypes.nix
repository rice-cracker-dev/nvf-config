{
  config.vim.luaConfigRC.ft = ''
    vim.filetype.add({
      extension = {
        ejs = "html",
        conf = "conf",
        env = "dotenv"
      },

      filename = {
        [".env"] = "dotenv",
        [".envrc"] = "direnv",
        ["tsconfig.json"] = "jsonc",
        [".prettierrc"] = "json"
      },

      pattern = {
        ["%.env%.[%w_.-]+"] = "dotenv",
        ["compose.*%.ya?ml"] = "yaml.docker-compose",
        ["docker%-compose.*%.ya?ml"] = "yaml.docker-compose"
      }
    })
  '';
}
