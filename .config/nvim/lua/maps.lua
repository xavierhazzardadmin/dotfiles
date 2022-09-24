local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

map("n", "<C-e>", ":q", default_opts)
-- Increment/decrement
map('n', '+', '<C-a>', default_opts)
map('n', '-', '<C-x>', default_opts)

-- Delete a word backwards
map('n', 'dw', 'vb"_d', default_opts)
map('n', '<C-a>', 'gg<S-v>G', default_opts)

-- New tab
map('n', 'te', ':tabedit', default_opts)

-- Split window
map('n', 'ss', ':split<Return><C-w>w', default_opts)
map('n', 'sv', ':vsplit<Return><C-w>w', default_opts)

-- Move window
map('n', '<Space>', '<C-w>w', default_opts)
map('', 'sh', '<C-w>h', default_opts)
map('', 'sk', '<C-w>k', default_opts)
map('', 'sj', '<C-w>j', default_opts)
map('', 'sl', '<C-w>l', default_opts)

-- Resize window
map('n', '<C-w><left>', '<C-w><', default_opts)
map('n', '<C-w><right>', '<C-w>>', default_opts)
map('n', '<C-w><up>', '<C-w>+', default_opts)
map('n', '<C-w><down>', '<C-w>-', default_opts)

map('n', '<C-k>k', ':e ~/.lsp-maps.txt<CR>', default_opts)
map('n', 'SS', ':w! <CR>', default_opts)
