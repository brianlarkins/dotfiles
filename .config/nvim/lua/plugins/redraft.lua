return {
  "jim-at-jibba/nvim-redraft",
  dependencies = {
    { "folke/snacks.nvim", opts = { input = {} } },
  },
  event = "VeryLazy",
  build = "cd ts && npm install && npm run build",
  opts = {
    -- See Configuration section for options
  },
  config = function()
    require("nvim-redraft").setup({
      llm = {
        models = {
          { provider = "anthropic", model = "claude-3-5-sonnet-20241022", label = "Claude 3.5 Sonnet" },
          { provider = "copilot", model = "gpt-4o", label = "Copilot GPT-4o" },
        },
        default_model_index = 1,
      },
    })
  end,
}
