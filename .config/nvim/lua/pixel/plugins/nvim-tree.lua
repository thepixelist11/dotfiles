return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local function my_on_attach(bufnr)
      local api = require 'nvim-tree.api'
      local noop = function() end
      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)
      vim.keymap.set('n', '<C-i>', api.node.show_info_popup, opts 'Info')
      vim.keymap.set('n', '<C-k>', '5k', opts 'Move up 5')
    end

    require('nvim-tree').setup {
      on_attach = my_on_attach,
      view = {
        float = {
          enable = false,
          open_win_config = {
            relative = 'editor',
            width = 40,
            height = 60,
            col = 1,
            row = 0,
            border = 'rounded',
          },
        },
      },
      renderer = {
        group_empty = true,
        indent_markers = {
          enable = true,
        },
        icons = {
          web_devicons = {
            file = {
              enable = true,
            },
            folder = {
              enable = false,
            },
          },
          glyphs = {
            git = {
              unstaged = '✗',
              staged = '✓',
              unmerged = '',
              renamed = '➜',
              untracked = '★',
              deleted = '',
              ignored = '◌',
            },
          },
        },
      },
      filters = {
        dotfiles = false,
      },
      actions = {
        file_popup = {
          open_win_config = {
            col = 1,
            row = 1,
            relative = 'cursor',
            border = 'rounded',
            style = 'minimal',
          },
        },
      },
    }
  end,
}
