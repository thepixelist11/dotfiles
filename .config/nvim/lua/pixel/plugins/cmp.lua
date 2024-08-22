return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'L3MON4D3/LuaSnip',
    'SirVer/ultisnips',
    {
      'quangnguyen30192/cmp-nvim-ultisnips',
      config = function()
        require('cmp_nvim_ultisnips').setup {
          show_snippets = 'all',
          filetype_source = 'ultisnips_default',
          documentation = function(snippet)
            return snippet.description .. '\n\n' .. snippet.value
          end,
        }

        require('luasnip.loaders.from_snipmate').lazy_load()
      end,
    },
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    cmp.setup {
      snippet = {
        expand = function(args)
          -- if luasnip then
          luasnip.lsp_expand(args.body)
          -- end
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<S-TAB>'] = cmp.mapping.confirm { select = true },
        ['<C-Space>'] = cmp.mapping.complete {},
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'ultisnips' },
        { name = 'path' },
      },
    }
  end,
}
