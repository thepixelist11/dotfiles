return {
  'marko-cerovac/material.nvim',
  -- dependencies = {
  --   'sainnhe/edge',
  --   'rebelot/kanagawa.nvim',
  --   'oxfist/night-owl.nvim',
  -- },

  -- 'uZer/pywal16.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'material-darker'

    vim.cmd [[
      highlight RenderMarkdownH1Bg guifg=#b3f6c0 guibg=#2b352d
      highlight RenderMarkdownH2Bg guifg=#c792ea guibg=#2e2633
      highlight RenderMarkdownH3Bg guifg=#8cf8f7 guibg=#253535
      highlight RenderMarkdownH4Bg guifg=#89ddff guibg=#253136
      highlight RenderMarkdownH5Bg guifg=#ffcb6b guibg=#362e20
      highlight RenderMarkdownH6Bg guifg=#ff5370 guibg=#361c21
    ]]

    -- CMP
    vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = '#808080' })
    vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#89ddff' })
    vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' })

    vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg = 'NONE', fg = '#b3f6c0' })
    vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
    vim.api.nvim_set_hl(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })
    vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg = 'NONE', fg = '#c792ea' })
    vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })
    vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = '#D4D4D4' })
    vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
    vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })

    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE', fg = '#d4d4d4' })
    vim.api.nvim_set_hl(0, 'ZenBg', { bg = 'NONE', ctermbg = 0 })

    vim.defer_fn(function()
      vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE', fg = '#777777' })
      vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#89d5f9', fg = '#1a1a1a' })
    end, 300)

    vim.api.nvim_set_hl(0, 'Comment', { bg = 'NONE', fg = '#546e7a', italic = true })
    vim.api.nvim_set_hl(0, 'LineNr', { bg = 'NONE', fg = '#546e7a' })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { link = 'Cursor' })
    local function update_cursorline_nr_color()
      local cursor_hl = vim.api.nvim_get_hl(0, { name = 'Cursor', link = false })

      if cursor_hl and cursor_hl.bg then
        vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = string.format('#%06x', cursor_hl.bg), bg = 'NONE' })
      end
    end

    vim.api.nvim_create_augroup('CursorLineNrUpdate', { clear = true })
    vim.api.nvim_create_autocmd({ 'CursorMoved', 'VimEnter', 'WinEnter', 'BufEnter' }, {
      group = 'CursorLineNrUpdate',
      callback = update_cursorline_nr_color,
    })

    -- Latex stuff
    vim.cmd [[highlight Conceal guifg=#80A8FB guibg=NONE guisp=NONE]]
    vim.cmd [[highlight link @markup.math.latex Conceal]]
    vim.cmd [[highlight link @function.latex Conceal]]
    vim.cmd [[highlight link @operator.latex Conceal]]

    -- Zen mode remove sides
    vim.cmd [[highlight ZenBg guibg=NONE]]
  end,
}
