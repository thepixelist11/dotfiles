---@diagnostic disable: missing-fields

return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  dependencies = {
    'windwp/nvim-ts-autotag',
    'nvim-treesitter/nvim-treesitter-context', -- Add the context plugin here
  },
  config = function()
    local treesitter = require 'nvim-treesitter.configs'
    local treesitter_context = require 'treesitter-context'

    -- Configure Treesitter
    treesitter.setup {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
        disable = { 'html' },
        autotag = {
          enable = true,
        },
        ensure_installed = {
          'json',
          'javascript',
          'typescript',
          'tsx',
          'yaml',
          'html',
          'css',
          'markdown',
          'markdown_inline',
          'bash',
          'lua',
          'vim',
          'dockerfile',
          'gitignore',
          'c',
          'rust',
        },
        incremental_selection = {
          enable = false,
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
      },
    }

    -- Configure Treesitter Context
    treesitter_context.setup {
      max_lines = 0,
      min_window_height = 0,
      line_numbers = true,
      multiline_threshold = 20,
      trim_scope = 'outer',
      mode = 'cursor',
      separator = nil,
      zindex = 20,
      on_attach = nil,
    }
  end,
}
