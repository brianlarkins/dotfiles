require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "clangd" }
})

require'lspconfig'.clangd.setup{}

-- local lspconfig = require'lspconfig'
-- local root_pattern = lspconfig.util.root_pattern
-- require"lspconfig".jdtls.setup{}
-- require"lspconfig".jdtls.setup
--   root_dir = root_pattern('.git'), }
