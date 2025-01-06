vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'pixel.lazy-setup'
require 'pixel.opts'
require 'pixel.keymaps'

function ZathuraOpenPdf()
  local fullPath = vim.fn.expand '%:p'
  local pdfFile = fullPath:gsub('%.tex$', '.pdf')
  vim.cmd("silent !zathura '" .. pdfFile .. "' &")
end

vim.api.nvim_set_keymap('n', '<A-p>', ':lua ZathuraOpenPdf()<CR>', { noremap = true, silent = true })
