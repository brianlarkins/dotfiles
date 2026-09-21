local builtin = require('telescope.builtin')

local set = vim.keymap.set
local opts = { noremap = true, silent = true }

-- telescope
set('n', '<leader>ff', builtin.find_files, opts)
set('n', '<leader>fg', builtin.live_grep, opts)
set('n', '<leader>fb', builtin.buffers, opts)
set('n', '<leader>fh', builtin.help_tags, opts)

-- Move between windows
set('n', '<c-j>', '<c-w><c-j>', opts)
set('n', '<c-k>', '<c-w><c-k>', opts)
set('n', '<c-l>', '<c-w><c-l>', opts)
set('n', '<c-h>', '<c-w><c-h>', opts)

-- Resize windows
set('n', '<M-,>', '<c-w>5<', opts)
set('n', '<M-.>', '<c-w>5>', opts)
set('n', '<M-t>', '<c-w>+', opts)
set('n', '<M-s>', '<c-w>-', opts)
set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

-- turn off highlighting
set('n', '<esc><esc>', '<cmd>noh<cr>', opts)


-- barbar keymaps
--
-- Move to previous/next
-- set('n', '<A-,>', '<cmd>BufferPrevious<cr>', opts)
-- set('n', '<A-.>', '<cmd>BufferNext<cr>', opts)
-- Re-order to previous/next
set('n', '<A-<>', '<cmd>BufferMovePrevious<cr>', opts)
set('n', '<A->>', '<cmd>BufferMoveNext<cr>', opts)
-- Goto buffer in position...
set('n', '<A-1>', '<cmd>BufferGoto 1<cr>', opts)
set('n', '<A-2>', '<cmd>BufferGoto 2<cr>', opts)
set('n', '<A-3>', '<cmd>BufferGoto 3<cr>', opts)
set('n', '<A-4>', '<cmd>BufferGoto 4<cr>', opts)
set('n', '<A-5>', '<cmd>BufferGoto 5<cr>', opts)
set('n', '<A-6>', '<cmd>BufferGoto 6<cr>', opts)
set('n', '<A-7>', '<cmd>BufferGoto 7<cr>', opts)
set('n', '<A-8>', '<cmd>BufferGoto 8<cr>', opts)
set('n', '<A-9>', '<cmd>BufferGoto 9<cr>', opts)
set('n', '<A-0>', '<cmd>BufferLast<cr>', opts)
-- Pin/unpin buffer
set('n', '<A-p>', '<cmd>BufferPin<cr>', opts)
-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned
-- Close buffer
set('n', '<A-c>', '<cmd>BufferClose<cr>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
-- set('n', '<C-p>', '<cmd>BufferPick<cr>', opts)
-- Sort automatically by...
set('n', '<leader>bb', '<cmd>BufferOrderByBufferNumber<cr>', opts)
set('n', '<leader>bn', '<cmd>BufferOrderByName<cr>', opts)
set('n', '<leader>bd', '<cmd>BufferOrderByDirectory<cr>', opts)
set('n', '<leader>bl', '<cmd>BufferOrderByLanguage<cr>', opts)
set('n', '<leader>bw', '<cmd>BufferOrderByWindowNumber<cr>', opts)
