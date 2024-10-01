return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-calc',
    'L3MON4D3/LuaSnip',
    'David-Kunz/cmp-npm',
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
    local icons = {
      Text = '',
      Method = '󰆧',
      Function = '󰊕',
      Constructor = '',
      Field = '󰇽',
      Variable = '󰫧',
      Class = '󰠱',
      Interface = '',
      Module = '',
      Property = '󰜢',
      Unit = '',
      Value = '󰎠',
      Enum = '',
      Keyword = '󰌋',
      Snippet = '',
      Color = '󰏘',
      File = '󰈙',
      Reference = '',
      Folder = '󰉋',
      EnumMember = '',
      Constant = '󰏿',
      Struct = '',
      Event = '',
      Operator = '󰆕',
      TypeParameter = '󰅲',
    }

    local custom_icon = {
      calc = '󰃬',
    }

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
        { name = 'calc' },
        { name = 'npm', keyword_length = 4 },
      },
      formatting = {
        mode = 'text_symbol',
        fields = { 'kind', 'abbr' },
        expandable_indicator = true,
        format = function(entry, vim_item)
          vim_item.kind = string.format('%s %s', icons[vim_item.kind], vim_item.kind)
          if entry.source.name == 'calc' then
            vim_item.kind = custom_icon.calc
          end
          vim_item.menu = ({
            buffer = '[Buffer]',
            nvim_lsp = '[LSP]',
            luasnip = '[LuaSnip]',
            nvim_lua = '[Lua]',
            latex_symbols = '[LaTeX]',
          })[entry.source.name]
          return vim_item
        end,
      },
      performance = {
        max_view_entries = 20,
      },
      experimental = {
        ghost_text = true,
      },
      window = {
        documentation = cmp.config.window.bordered {
          winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
        },
        completion = cmp.config.window.bordered {
          winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
        },
      },
    }
  end,
}
