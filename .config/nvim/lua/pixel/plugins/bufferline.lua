return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require 'bufferline'

    bufferline.setup {
      options = {
        mode = 'buffers',
        style_preset = bufferline.style_preset.default,
        numbers = 'none',
        close_command = 'bdelete! %d',
        right_mouse_command = 'bdelete! %d',
        left_mouse_command = 'buffer %d',
        middle_mouse_command = nil,
        indicator = {
          icon = '▎',
          style = 'icon',
        },
        buffer_close_icon = '󰅖',
        modified_icon = '● ',
        close_icon = '',
        left_trunc_marker = ' ',
        right_trunc_marker = ' ',
        max_name_length = 18,
        max_prefix_length = 15,
        truncate_names = true,
        tab_size = 18,
        diagnostics = 'nvim_lsp',
        diagnostics_update_on_event = true,
        offsets = {
          {
            filetype = 'NvimTree',
            text = '',
            text_align = 'left',
            separator = false,
          },
        },
        groups = {
          items = {
            require('bufferline.groups').builtin.pinned:with { icon = ' 󰐃 ' },
          },
        },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true,
        duplicates_across_groups = false,
        persist_buffer_sort = true,
        move_wraps_at_ends = false,
        separator_style = 'slant',
        always_show_bufferline = true,
        auto_toggle_bufferline = true,
      },
    }
  end,
}
