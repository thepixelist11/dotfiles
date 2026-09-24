-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Snacks animations
vim.g.snacks_animate = false

-- if the completion engine supports the AI source,
-- use that instead of inline suggestions
vim.g.ai_cmp = false

-- use 4 spaces for tabs
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- disable cursorline
vim.opt.cursorline = false

vim.g.lazyvim_prettier_needs_config = true

-- Load the current theme
local theme_dir = vim.fn.expand("~")
local theme_file = vim.fn.expand("~/.theme")

local function apply_theme()
  local f = io.open(theme_file, "r")
  if not f then
    return
  end

  local theme = f:read("*l")
  f:close()

  if theme == "dark" or theme == "light" then
    vim.o.background = theme
  end
end

apply_theme()

local watcher = vim.loop.new_fs_event()

watcher:start(
  theme_dir,
  {},
  vim.schedule_wrap(function(_, filename)
    if filename == ".theme" then
      apply_theme()
    end
  end)
)

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    watcher:stop()
    watcher:close()
  end,
})

vim.lsp.config("*", {
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  flags = {
    debounce_text_changes = 150,
  },
})
