-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Open the quickfix list with diagnostics when pressing <leader>q in normal mode
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode with <Esc><Esc>
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ More Keymaps - extended from Kickstart ]]

-- Save file with Ctrl+S
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', { desc = 'Save file' })
vim.keymap.set('i', '<C-s>', '<Esc><cmd>w<CR>a', { desc = 'Save file (insert mode)' })

-- Quit with Ctrl+Q
vim.keymap.set('n', '<C-q>', '<cmd>q<CR>', { desc = 'Quit' })

-- Delete current line to clipboard with X (cut line)
vim.keymap.set('n', 'X', '"+dd', { desc = 'Cut line to clipboard' })

-- Delete without copying to clipboard (use black hole register)
vim.keymap.set('n', 'dd', '"_dd', { desc = 'Delete line without copying' })
vim.keymap.set('n', 'x', '"_x', { desc = 'Delete character without copying' })
vim.keymap.set('v', 'd', '"_d', { desc = 'Delete without copying' })

-- Session management: save and load workspace state
-- These save/restore open buffers, window layouts, cursor positions, etc.
vim.keymap.set('n', '<leader>ss', ':mksession! .session.vim<CR>', { noremap = true, silent = false, desc = '[S]ession [S]ave' })
vim.keymap.set('n', '<leader>sl', ':source .session.vim<CR>', { noremap = true, silent = false, desc = '[S]ession [L]oad' })
