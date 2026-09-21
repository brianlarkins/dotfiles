-- enable line numbers
vim.opt.number        = true

-- open new windows in better locations
vim.opt.splitbelow    = true
vim.opt.splitright    = true

-- don't wrap lines
vim.opt.wrap          = false

-- setup tabs / default spacing
vim.opt.expandtab     = true
vim.opt.tabstop       = 2
vim.opt.shiftwidth    = 2

-- sync nvim / system clipboard
local function use_osc52()
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
      ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
      ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
      ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
    },
  }
end

if os.getenv("SSH_CONNECTION") ~= nil then
  use_osc52()
else
  local has_provider = vim.fn.executable('pbcopy') == 1   -- macOS
    or vim.fn.executable('wl-copy') == 1                  -- Wayland
    or vim.fn.executable('xclip') == 1                    -- X11
    or vim.fn.executable('xsel') == 1                     -- X11 alt
  if has_provider then
    vim.opt.clipboard = "unnamedplus"
  else
    use_osc52()
  end
end

-- keep screen centered
--vim.opt.scrolloff     = 999

-- don't leave `file~` backups lying around after a write. `writebackup` stays
-- on (its copy is transient and removed once the write succeeds), so a failed
-- write still can't destroy the original; backupdir only holds that temp copy.
vim.opt.backup    = false
vim.opt.backupdir = "~/.backup,/tmp"

-- allow ragged edges for visual block mode
vim.opt.virtualedit   = "block"

-- show edit previews in a split window
vim.opt.inccommand    = "split"

-- ignore command case
vim.opt.ignorecase    = true

-- allow 24-bit colors / fancy fonts / powerline / nerd fonts
vim.opt.termguicolors = true

-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader       = " " 

-- reserve space for signs in the gutter
vim.opt.signcolumn = 'yes'

-- block cursor
vim.opt["guicursor"] = ""

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    }
  }
})
