return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
  },
  config = function()
    require("codecompanion").setup({
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true
          }
        }
      }
    })
  end,
  opts = {
    ignore_warnings = true,
    adapters = {
      http = {
        anthropic = function()
          return require("codecompanion.adapters").extend("anthropic", {
            env = {
              api_key = "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"
            },
          })
        end,
      },
    },
    strategies = {
      chat = {
        adapter = "anthropic",
      }
    }
  }
}
