return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
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
