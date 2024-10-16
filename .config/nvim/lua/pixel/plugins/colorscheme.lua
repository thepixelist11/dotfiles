return {
  'marko-cerovac/material.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd 'colorscheme material-darker'
    vim.api.nvim_set_hl(0, 'Comment', { italic = true, fg = '#4A4C4C' })
  end,
}
