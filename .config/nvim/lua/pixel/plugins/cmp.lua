return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-calc',
    'L3MON4D3/LuaSnip',
    'David-Kunz/cmp-npm',
    'max397574/cmp-greek',
    'SirVer/ultisnips',
    'xzbdmw/colorful-menu.nvim',
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
    local colorful_menu = require 'colorful-menu'
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

    colorful_menu.setup {
      -- If the built-in logic fails to find a suitable highlight group,
      -- this highlight is applied to the label.
      fallback_highlight = '@variable',
      -- If provided, the plugin truncates the final displayed text to
      -- this width (measured in display cells). Any highlights that extend
      -- beyond the truncation point are ignored. When set to a float
      -- between 0 and 1, it'll be treated as percentage of the width of
      -- the window: math.floor(max_width * vim.api.nvim_win_get_width(0))
      -- Default 60.
      max_width = 60,
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
        { name = 'greek' },
        { name = 'npm', keyword_length = 4 },
      },
      -- formatting = { -- NOTE: My formatting
      --   mode = 'text_symbol',
      --   fields = { 'kind', 'abbr' },
      --   expandable_indicator = true,
      --   format = function(entry, vim_item)
      --     vim_item.kind = string.format('%s %s', icons[vim_item.kind], vim_item.kind)
      --     if entry.source.name == 'calc' then
      --       vim_item.kind = custom_icon.calc
      --     end
      --     vim_item.menu = ({
      --       buffer = '[Buffer]',
      --       nvim_lsp = '[LSP]',
      --       luasnip = '[LuaSnip]',
      --       nvim_lua = '[Lua]',
      --       latex_symbols = '[LaTeX]',
      --     })[entry.source.name]
      --     return vim_item
      --   end,
      -- },
      formatting = {
        mode = 'text_symbol',
        fields = { 'kind', 'abbr' },
        expandable_indicator = true,
        format = function(entry, vim_item)
          local highlights_info = colorful_menu.cmp_highlights(entry)

          -- highlight_info is nil means we are missing the ts parser, it's
          -- better to fallback to use default `vim_item.abbr`. What this plugin
          -- offers is two fields: `vim_item.abbr_hl_group` and `vim_item.abbr`.
          if highlights_info ~= nil then
            vim_item.abbr_hl_group = highlights_info.highlights
            vim_item.abbr = highlights_info.text
          end
          vim_item.kind = string.format('%s %s', icons[vim_item.kind], vim_item.kind)
          if entry.source.name == 'calc' then
            vim_item.kind = custom_icon.calc
          end

          return vim_item
        end,
      },
      performance = {
        max_view_entries = 20,
      },
      experimental = {
        ghost_text = true,
      },
      -- window = {
      --   documentation = cmp.config.window.bordered {
      --     winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
      --   },
      --   completion = cmp.config.window.bordered {
      --     winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
      --   },
      -- },
    }
  end,
}
