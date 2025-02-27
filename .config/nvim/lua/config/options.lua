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
if os.getenv("SSH_CONNECTION") == nil
  then
    vim.opt.clipboard     = "unnamedplus"
  else
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

-- keep screen centered
--vim.opt.scrolloff     = 999

vim.opt.backup    = true
vim.opt.backupdir = "./.backup,~/.backup,.,/tmp"

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
