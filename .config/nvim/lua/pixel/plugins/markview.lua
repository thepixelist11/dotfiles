return {
  'OXY2DEV/markview.nvim',
  lazy = false,

  config = function()
    local colors = require 'markview.colors'
    require('markview').setup {
      --   -- THIS IS ALL FOR HYBRID MODE
      --   modes = { 'n', 'no', 'c' },
      --   hybrid_modes = { 'n', 'v', 'vb', 'vc' },
      --
      callbacks = {
        on_enable = function(_, win)
          vim.wo[win].conceallevel = 0
          vim.wo[win].concealcursor = '-n'
        end,
      },
      checkboxes = {
        enable = true,

        checked = {
          text = '󰄴',
        },
        unchecked = {
          text = '󰝦',
        },
        pending = {},
      },
      list_items = {
        enable = true,

        marker_minus = {
          text = '-',
        },
        marker_plus = {
          text = '',
        },
        marker_star = {
          add_padding = false,
          text = ' ',
        },
      },
      tables = {
        enable = true,
        use_virt_lines = true,
      },
      inline_codes = {
        enable = true,
      },
      horizontal_rules = {
        enable = true,
        parts = {

          {
            type = 'repeating',
            text = '─',

            direction = 'left',
            hl = {
              'Gradient1',
              'Gradient2',
              'Gradient3',
              'Gradient4',
              'Gradient5',
              'Gradient6',
              'Gradient7',
              'Gradient8',
              'Gradient9',
              'Gradient10',
            },

            repeat_amount = function()
              local w = vim.api.nvim_win_get_width(0)
              local l = vim.api.nvim_buf_line_count(0)

              l = vim.fn.strchars(tostring(l)) + 4

              return math.floor((w - (l + 3)) / 2)
            end,
          },
          {
            type = 'repeating',
            text = '─',

            direction = 'right',
            hl = {
              'Gradient1',
              'Gradient2',
              'Gradient3',
              'Gradient4',
              'Gradient5',
              'Gradient6',
              'Gradient7',
              'Gradient8',
              'Gradient9',
              'Gradient10',
            },

            repeat_amount = function()
              local w = vim.api.nvim_win_get_width(0)
              local l = vim.api.nvim_buf_line_count(0)

              l = vim.fn.strchars(tostring(l)) + 4

              return math.ceil((w - (l + 3)) / 2)
            end,
          },
        },
      },
    }
  end,

  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
}
