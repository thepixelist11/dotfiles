return {
  'feline-nvim/feline.nvim',
  config = function()
    local line_ok, feline = pcall(require, 'feline')
    if not line_ok then
      return
    end

    local material = {
      fg = '#abb2bf',
      bg = '#212121',
      green = '#c3e88d',
      yellow = '#ffcb6b',
      purple = '#c792ea',
      orange = '#f78c6c',
      peanut = '#f6d5a4',
      red = '#f07178',
      aqua = '#61afef',
      darkblue = '#282c34',
      dark_red = '#f75f5f',
    }

    local vi_mode_colors = {
      NORMAL = 'green',
      OP = 'green',
      INSERT = 'yellow',
      VISUAL = 'purple',
      LINES = 'orange',
      BLOCK = 'dark_red',
      REPLACE = 'red',
      COMMAND = 'aqua',
    }

    local c = {
      vim_mode = {
        provider = {
          name = 'vi_mode',
          opts = {
            show_mode_name = true,
            padding = 'center',
          },
        },
        hl = function()
          return {
            fg = require('feline.providers.vi_mode').get_mode_color(),
            bg = 'darkblue',
            style = 'bold',
            name = 'NeovimModeHLColor',
          }
        end,
        left_sep = 'block',
        right_sep = 'block',
      },
      gitBranch = {
        provider = 'git_branch',
        hl = {
          fg = 'peanut',
          bg = 'darkblue',
          style = 'bold',
        },
        left_sep = 'block',
        right_sep = 'block',
      },
      gitDiffAdded = {
        provider = 'git_diff_added',
        icon = '+',
        hl = {
          fg = 'green',
          bg = 'darkblue',
        },
        left_sep = 'block',
        right_sep = 'block',
      },
      gitDiffRemoved = {
        provider = 'git_diff_removed',
        icon = '-',
        hl = {
          fg = 'red',
          bg = 'darkblue',
        },
        left_sep = 'block',
        right_sep = 'block',
      },
      gitDiffChanged = {
        provider = 'git_diff_changed',
        icon = '~',
        hl = {
          fg = 'aqua',
          bg = 'darkblue',
        },
        left_sep = 'block',
        right_sep = 'block',
      },
      rightEdge = {
        provider = '',
        hl = {
          fg = 'darkblue',
          bg = 'bg',
        },
      },
      separator = {
        provider = '',
      },
      fileinfo = {
        provider = {
          name = 'file_info',
          opts = {
            type = 'relative-short',
          },
        },
        hl = {
          style = 'bold',
        },
        left_sep = ' ',
        right_sep = ' ',
      },
      diagnostic_errors = {
        provider = 'diagnostic_errors',
        hl = {
          fg = 'red',
        },
      },
      diagnostic_warnings = {
        provider = 'diagnostic_warnings',
        hl = {
          fg = 'yellow',
        },
      },
      diagnostic_hints = {
        provider = 'diagnostic_hints',
        hl = {
          fg = 'aqua',
        },
      },
      diagnostic_info = {
        provider = 'diagnostic_info',
      },
      file_type = {
        provider = {
          name = 'file_type',
          opts = {
            filetype_icon = true,
            case = 'titlecase',
          },
        },
        hl = {
          fg = 'yellow',
          bg = 'darkblue',
          style = 'bold',
        },
        left_sep = {
          {
            str = 'slant_left_2',
          },
          {
            str = ' ',
            hl = {
              bg = 'darkblue',
            },
          },
        },
        right_sep = 'block',
      },
      file_encoding = {
        provider = 'file_encoding',
        hl = {
          fg = 'orange',
          bg = 'darkblue',
          style = 'italic',
        },
        left_sep = 'block',
        right_sep = 'block',
      },
      position = {
        provider = 'position',
        hl = {
          fg = 'green',
          bg = 'darkblue',
          style = 'bold',
        },
        left_sep = 'block',
        right_sep = 'block',
      },
      line_percentage = {
        provider = 'line_percentage',
        hl = {
          fg = 'aqua',
          bg = 'darkblue',
          style = 'bold',
        },
        left_sep = 'block',
        right_sep = 'block',
      },
      scroll_bar = {
        provider = 'scroll_bar',
        hl = {
          fg = 'yellow',
          style = 'bold',
        },
      },
    }

    local left = {
      c.vim_mode,
      c.gitBranch,
      c.gitDiffAdded,
      c.gitDiffRemoved,
      c.gitDiffChanged,
      c.rightEdge,
      c.separator,
    }

    local middle = {
      c.fileinfo,
      c.diagnostic_errors,
      c.diagnostic_warnings,
      c.diagnostic_info,
      c.diagnostic_hints,
    }

    local right = {
      c.file_type,
      c.file_encoding,
      c.position,
      c.line_percentage,
    }

    local components = {
      active = {
        left,
        middle,
        right,
      },
      inactive = {
        left,
        middle,
        right,
      },
    }

    feline.setup {
      components = components,
      theme = material,
      vi_mode_colors = vi_mode_colors,
    }
  end,
}
