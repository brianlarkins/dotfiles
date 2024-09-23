local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnf)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

require('lspconfig').clangd.setup({})

local cmp = require('cmp')

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({}),
})


require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "clangd" },
  handlers = {
    lsp_zero.default_setup,
  },
  clangd = function()
    require'lspconfig'.clangd.setup{}
  end,
})
--
--
--require"lspconfig".jdtls.setup{}
-- local lspconfig = require'lspconfig'
-- local root_pattern = lspconfig.util.root_pattern
-- require"lspconfig".jdtls.setup
--   root_dir = root_pattern('.git'), }
