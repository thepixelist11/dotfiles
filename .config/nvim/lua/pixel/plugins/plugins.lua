-- This file is for smaller plugins that don't need much config

package.path = package.path .. ';' .. vim.fn.expand '$HOME' .. '/.luarocks/share/lua/5.1/?/init.lua'
package.path = package.path .. ';' .. vim.fn.expand '$HOME' .. '/.luarocks/share/lua/5.1/?.lua'

return {

  { 'tpope/vim-sleuth' },

  { 'numToStr/Comment.nvim' },

  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { 'barrett-ruth/live-server.nvim', opts = { args = { '--port=8080', '--browser=firefox' } } },

  { 'jghauser/follow-md-links.nvim' },

  { 'nfrid/markdown-togglecheck', dependencies = { 'nfrid/treesitter-utils' }, ft = { 'markdown' } },

  {
    'Myzel394/easytables.nvim',
    config = function()
      require('easytables').setup {}
    end,
  },

  { 'akinsho/git-conflict.nvim', version = '*', config = true },

  { 'nvim-treesitter/nvim-treesitter-context', opts = {} },

  { 'Sirver/ultisnips', event = { 'InsertEnter' } },

  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },

  {
    '3rd/image.nvim',
    config = function()
      local image = require 'image'
      image.setup()
    end,
  },

  {
    'ryleelyman/latex.nvim',
    config = function()
      require('latex').setup {}
    end,
  },

  {
    'bullets-vim/bullets.vim',
    ft = { 'markdown', 'text', 'gitcommit' },
  },

  {
    'lervag/vimtex',
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.vimtex_view_automatic = 1
      vim.g.vimtex_compiler_latexmk = {
        build_dir = '',
        callback = 1,
        continuous = 1, -- Enables automatic recompilation on file save
        executable = 'latexmk',
        options = {
          '-shell-escape',
          '-verbose',
          '-file-line-error',
          '-synctex=1',
          '-interaction=nonstopmode',
        },
      }
    end,
  },

  {
    'Fildo7525/pretty_hover',
    event = 'LspAttach',
    opts = {},
  },

  {
    'numToStr/FTerm.nvim',
    config = function()
      require('FTerm').setup {
        border = 'rounded',
        dimensions = {
          height = 0.9,
          width = 0.9,
        },
      }
    end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
    config = function()
      require('ibl').setup()
    end,
  },

  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup()
    end,
  },
}
