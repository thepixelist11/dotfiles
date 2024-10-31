return {
  'xiyaowong/transparent.nvim',
  lazy = false,
  config = function()
    require('transparent').setup {
      extra_groups = { 'CmpPmenu', 'Pmenu' },
      exclude_groups = { 'CursorLine' },
    }
  end,
}
