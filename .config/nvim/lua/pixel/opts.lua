local g = vim.g
local o = vim.opt

-- Line numbers
o.number = true
o.relativenumber = true

-- Enable nerdfont
g.have_nerd_font = true

-- Enable mouse
o.mouse = 'a'

-- Don't show the mode
o.showmode = false

-- Enable 24-bit color
o.termguicolors = true

-- Disable netrw in favour of nvim-tree
-- g.loaded_netrw = 1
-- g.loaded_netrwPlugin = 1

-- Sync clipboard between OS and Neovim.
o.clipboard = 'unnamedplus'

-- Set max line length to 80 in md files
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.bo.textwidth = 80
  end,
})

-- Enable break indent
o.breakindent = true

-- Save undo history
o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
o.ignorecase = true
o.smartcase = true

-- Keep signcolumn on by default
o.signcolumn = 'yes'

-- Decrease update time
o.updatetime = 250

-- Configure how new splits should be opened
o.splitright = true
o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
o.list = true
o.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
o.inccommand = 'split'

-- Show which line your cursor is on
o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
o.scrolloff = 15

o.tabstop = 4
o.shiftwidth = 2
o.expandtab = true
o.softtabstop = 2

-- Set highlight on search
o.hlsearch = true

-- Wrapping
o.lbr = true
o.wrap = true

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Disable concealing on the current line in all files other than md
vim.cmd [[
  augroup ConcealCursorSettings
    autocmd!
    autocmd FileType * setlocal concealcursor-=n
    autocmd FileType markdown setlocal concealcursor+=n
  augroup END
]]

-- Disable broken syntax highlighing in .snippets files
-- vim.cmd 'autocmd BufRead,BufNewFile *.snippets set filetype=text'

-- Ultisnips
g.UltiSnipsExpandTrigger = '<S-Tab>'
g.UltiSnipsEditSplit = 'vertical'
g.UltiSnipsJumpForwardTrigger = '<C-Up>'
g.UltiSnipsJumpBackwardTrigger = '<C-Down>'

-- VimTex
vim.cmd [[
  filetype plugin indent on
]]

g.vimtex_view_method = 'zathura'

g.vimtex_view_general_viewer = 'okular'
g.vimtex_view_general_options = '--unique file:@pdf#src:@line@tex'

g.vimtex_compiler_method = 'latexrun'

-- Disable auto comment
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    vim.opt.formatoptions:remove { 'c', 'r', 'o' }
  end,
  desc = 'Disable new line comment',
})
