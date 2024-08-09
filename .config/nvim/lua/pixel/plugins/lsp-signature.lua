return {
  'ray-x/lsp_signature.nvim',
  event = 'VeryLazy',
  opts = {
    hint_prefix = ' ',
    floating_window = false,
  },
  config = function(_, opts)
    require('lsp_signature').setup(opts)
  end,
}
