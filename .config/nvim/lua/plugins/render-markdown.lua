return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons", -- language icon above code blocks
    },
    -- render-markdown reads lazy's `ft` to populate its own `file_types`
    ft = { "markdown" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      -- render_modes defaults to { "n", "c", "t" }, so insert and visual mode
      -- drop back to the raw source for editing.
      completions = {
        -- checkbox and callout completions, picked up by nvim-cmp
        lsp = { enabled = true },
      },
      latex = {
        -- needs pylatexenc or utftex on PATH, neither is installed
        enabled = false,
      },
    },
    keys = {
      {
        "<leader>mm",
        "<cmd>RenderMarkdown buf_toggle<cr>",
        ft = "markdown",
        desc = "Toggle rendering (buffer)",
      },
      {
        "<leader>mp",
        "<cmd>RenderMarkdown preview<cr>",
        ft = "markdown",
        desc = "Rendered preview to the side",
      },
      {
        "<leader>me",
        "<cmd>RenderMarkdown expand<cr>",
        ft = "markdown",
        desc = "Show 1 more raw line around cursor",
      },
      {
        "<leader>mc",
        "<cmd>RenderMarkdown contract<cr>",
        ft = "markdown",
        desc = "Show 1 fewer raw line around cursor",
      },
    },
  },
}
