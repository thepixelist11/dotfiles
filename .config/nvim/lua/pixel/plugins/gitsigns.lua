return {
  'lewis6991/gitsigns.nvim',
  event = 'VimEnter',
  config = function()
    vim.api.nvim_set_hl(0, 'SignColumn', { clear })
    require('gitsigns').setup {
      signs = {
        add = { text = '┃' },
        change = { text = '┃' },
        delete = { text = '┃' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
      },
    }
  end,
}
