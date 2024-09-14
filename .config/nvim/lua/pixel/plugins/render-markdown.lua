return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  opts = {
    latex = { enabled = false },
    win_options = {
      conceallevel = { rendered = 2 },
    },
    heading = {
      enabled = true,
      sign = true,
      position = 'overlay',
      icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
      signs = { '󰫎 ' },
      width = 'full',
      left_pad = 0,
      right_pad = 0,
      min_width = 0,
      border = false,
      border_prefix = false,
      above = '▄',
      below = '▀',
      backgrounds = {
        'RenderMarkdownH1Bg',
        'RenderMarkdownH2Bg',
        'RenderMarkdownH3Bg',
        'RenderMarkdownH4Bg',
        'RenderMarkdownH5Bg',
        'RenderMarkdownH6Bg',
      },
      foregrounds = {
        'RenderMarkdownH1',
        'RenderMarkdownH2',
        'RenderMarkdownH3',
        'RenderMarkdownH4',
        'RenderMarkdownH5',
        'RenderMarkdownH6',
      },
    },
    bullet = {
      enabled = true,
      icons = { '-', '●', '○', '◇' },
      left_pad = 0,
      right_pad = 0,
      highlight = 'RenderMarkdownBullet',
    },
    pipe_table = {
      enabled = true,
      --  heavy:  use thicker border characters
      --  double: use double line border characters
      --  round:  use round border corners
      --  none:   does nothing
      preset = 'round',
    },
  },
}
