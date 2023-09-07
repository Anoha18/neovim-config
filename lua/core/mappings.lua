local keymap = vim.keymap

keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- Move tabs
keymap.set('n', '<Tab>', 'gt') 
keymap.set('n', '<S-Tab>', 'gT')

-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 's<left>', '<C-w>h')
keymap.set('', 's<up>', '<C-w>k')
keymap.set('', 's<down>', '<C-w>j')
keymap.set('', 's<right>', '<C-w>l')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

local opts = { noremap = true, silent = true }

-- Definition maps
keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
keymap.set('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
keymap.set('n', 'sd', '<cmd>Lspsaga show_line_diagnostics<cr>', opts)
keymap.set('n', '<C-j>', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
keymap.set('n', '<C-k>', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opts)

-- Neotree maps
keymap.set('n', '\\e', ':Neotree toggle<cr>', opts)
keymap.set('n', '\\o', ':Neotree focus<cr>', opts)
keymap.set('n', '\\s', ':Neotree float git_status<cr>', opts)
keymap.set('n', '\\f', ':Neotree toggle float<cr>', opts)

keymap.set('n', '\\L', ':Lazy<CR>', opts)
