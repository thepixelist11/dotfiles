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
}
