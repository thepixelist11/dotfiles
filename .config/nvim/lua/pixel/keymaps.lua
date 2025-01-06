-- Hide highlights on escape in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostics
vim.keymap.set('n', '<leader>se', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Start live server
vim.keymap.set('n', '<leader>lss', ':LiveServerStart<CR>', { noremap = true })

-- MarkdownPreview
vim.keymap.set('n', '<leader>mdp', ':MarkdownPreview<CR>', { noremap = true })
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true })

-- TODO:
-- vim.keymap.set('n', 'K', require('pretty_hover').hover, { silent = true })

-- Open lsp_signature
-- vim.keymap.set('i', '<F3>', function()
--   require('lsp_signature').toggle_float_win()
-- end, { silent = true, noremap = true })

-- Prevent yanking from single line deletion in normal mode
vim.keymap.set('n', 'd', '"_d', { noremap = true })

-- Do not yank on X
vim.keymap.set('n', 'x', ':normal! "_x<CR>', { noremap = true, silent = true })

-- Quit neovim with XF86AudioStop
vim.keymap.set('n', '', ':qa!<CR>', { noremap = true })

-- Yank to system clipboard
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true })

-- Exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window', silent = true })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window', silent = true })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window', silent = true })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window', silent = true })

vim.keymap.set('n', '<A-j>', ':m .+1<CR>==') -- Move line up
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==') -- Move line down
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv") -- Move line up
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv") -- Move line down

vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

vim.keymap.set('n', '<C-h>', '5h', { noremap = true })
vim.keymap.set('n', '<C-j>', '5j', { noremap = true })
vim.keymap.set('n', '<C-k>', '5k', { noremap = true })
vim.keymap.set('n', '<C-l>', '5l', { noremap = true })

vim.keymap.set('v', '<C-h>', '5h', { noremap = true })
vim.keymap.set('v', '<C-j>', '5j', { noremap = true })
vim.keymap.set('v', '<C-k>', '5k', { noremap = true })
vim.keymap.set('v', '<C-l>', '5l', { noremap = true })

-- Open new instance of kitty in current working directory
vim.keymap.set('n', '<leader>cpk', ':!kitty $(pwd) &<CR><CR>', { noremap = true })

-- Find and replace
vim.api.nvim_set_keymap('n', '<leader>fr', ':%s///g<Left><Left><Left>', { noremap = true, silent = false })

-- Create terminal split
vim.keymap.set('n', '<leader>tt', ':split | term<CR>', { noremap = true })

-- Open link with firefox
vim.api.nvim_set_keymap('n', 'gx', [[:silent execute '!firefox ' . shellescape(expand('<cfile>'), 1)<CR>]], { noremap = true })

-- Search current selection in google
function GoogleSearch()
  local searchterm = vim.fn.getreg 'g'
  local url = 'http://google.com/search?q=' .. searchterm
  vim.fn.system { 'firefox', url }
end
vim.api.nvim_set_keymap('v', '<leader>gg', '"gy<Esc>:lua GoogleSearch()<CR>', { noremap = true, silent = true })

-- toggle checked / create checkbox if it doesn't exist
vim.keymap.set('n', '<leader>nn', require('markdown-togglecheck').toggle, { desc = 'Toggle Checkmark' })

-- Easytables create tabe
vim.keymap.set('n', '<leader>tc', ':EasyTablesCreateNew ')
vim.keymap.set('n', '<leader>te', ':EasyTablesImportThisTable')
vim.keymap.set('n', '<leader>tw', ':ExportTable<CR>')

-- Toggle transparency
vim.keymap.set('n', '<leader>ts', ':TransparentToggle<CR>', { silent = true })

-- Show signature
vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, { silent = true })

-- FTerm
vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- ZenMode
vim.keymap.set('n', '<A-z>', ':ZenMode<CR>', { silent = true })

-- Switch to header file
vim.keymap.set('n', '<leader>gh', ':Ouroboros<CR>', { silent = true })

-- CCC Picker
vim.keymap.set('n', '<leader>ccc', ':CccPick<CR>', { silent = true })
