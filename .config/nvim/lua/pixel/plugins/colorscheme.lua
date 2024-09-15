return {
  'marko-cerovac/material.nvim',

  -- 'AlphaTechnolog/pywal.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd 'colorscheme material-darker'
    -- local pywal = require 'pywal'
    -- pywal.setup()
  end,
}
