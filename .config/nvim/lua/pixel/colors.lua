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

-- Something changes these at some point, so I need to delay it slightly
vim.defer_fn(function()
  vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE', fg = '#777777' })
  vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#89d5f9', fg = '#1a1a1a' })
  -- vim.api.nvim_set_hl(0, 'RenderMarkdownCode', { bg = 'NONE' })
  -- vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#ff9800', fg = '#1a1a1a' })
end, 300)

-- TODO: make this match terminal cursor color
-- Cursor
vim.cmd 'highlight Cursor guifg=NONE guibg=#ffcc00'
vim.cmd 'highlight lCursor guifg=NONE guibg=#ffcc00'

-- Latex stuff
vim.cmd [[highlight Conceal guifg=#80A8FB guibg=NONE guisp=NONE]]
vim.cmd [[highlight link @markup.math.latex Conceal]]
vim.cmd [[highlight link @function.latex Conceal]]
vim.cmd [[highlight link @operator.latex Conceal]]

-- Zen mode remove sides
vim.cmd [[highlight ZenBg guibg=NONE]]
