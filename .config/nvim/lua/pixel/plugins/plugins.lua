-- This file is for smaller plugins that don't need much config

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
    'lervag/vimtex',
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_latexmk = { continuous = 1 }
    end,
  },
}
