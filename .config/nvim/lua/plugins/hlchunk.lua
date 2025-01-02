return {
  -- highlight graphics for spaces and block structure in programs
  {"shellRaining/hlchunk.nvim",
     event = { "BufReadPre", "BufNewFile" },
     config = function()
       require("hlchunk").setup({
         chunk = {
           enable = true,
           use_treesitter = true,
           delay = 0,
         },
         line_num = {
           enable = true,
           style = "#dfa649",
         },
         indent = {
           enable = false,
         },
         blank = {
           enable = true,
         },
       })
     end
  },
}
