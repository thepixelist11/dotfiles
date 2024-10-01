return {
  'ray-x/lsp_signature.nvim',
  event = 'VeryLazy',
  opts = {
    hint_prefix = ' ',
    bind = true,
    floating_window = false,
    handler_opts = {
      border = 'rounded',
    },
  },
  config = function(_, opts)
    require('lsp_signature').setup(opts)
  end,
}
