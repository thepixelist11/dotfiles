return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        {
          -- 'rafamadriz/friendly-snippets',
          'SirVer/ultisnips',
          'quangnguyen30192/cmp-nvim-ultisnips',
          config = function()
            require('cmp_nvim_ultisnips').setup {
              show_snippets = 'all',
              filetype_source = 'ultisnips_default',
              documentation = function(snippet)
                return snippet.description .. '\n\n' .. snippet.value
              end,
            }
            -- require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
    },
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    local cmp_ultisnips_mappings = require 'cmp_nvim_ultisnips.mappings'
    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        -- expand = function(args)
        --   luasnip.lsp_expand(args.body)
        -- end,
        expand = function(args)
          vim.fn['UltiSnips#Anon'](args.body)
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
        { name = 'ultisnips' },
        { name = 'nvim_ultisnips' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
      },
    }
  end,
}
