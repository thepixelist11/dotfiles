return {
  'rmagatti/alternate-toggler',
  config = function()
    require('alternate-toggler').setup {
      alternates = {
        ['=='] = '!=',
        ['.'] = ',',
        ['let'] = 'var',
        ['on'] = 'off',
        ['+='] = '-=',
      },
    }
    vim.keymap.set('n', '<leader>b', "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>")
  end,
}
