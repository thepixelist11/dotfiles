return {
  'marko-cerovac/material.nvim',
  -- 'uZer/pywal16.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    -- local pywal = require 'pywal'
    -- pywal.setup()
    vim.cmd 'colorscheme material-darker'
  end,
}
