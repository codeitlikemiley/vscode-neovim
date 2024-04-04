return {
    "L3MON4D3/LuaSnip",
    build = (not jit.os:find("Windows"))
        and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
      or nil,
    keys = function()
      return {}
    end,
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load({
          include = { "rust" },
        })

        require("luasnip.loaders.from_vscode").lazy_load({
          paths = "~/.config/nvim/snippets",
        })
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
  }
