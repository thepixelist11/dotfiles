return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = vim.fn.filereadable(vim.fn.expand("~/.theme")) == 1 and vim.fn
        .readfile(vim.fn.expand("~/.theme"))[1]
        :match("light") and "tokyonight-day" or "tokyonight-storm",
    },
    init = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          vim.api.nvim_set_hl(0, "Directory", { bold = true })
          vim.api.nvim_set_hl(0, "FloatermBorder", { bg = "NONE" })
        end,
      })
    end,
  },
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    keys = {
      { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
      { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
      { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
    },
  },
  {
    "nat-418/boole.nvim",
    config = function()
      require("boole").setup({
        mappings = {
          increment = "<C-a>",
          decrement = "<C-x>",
        },
        additions = {
          { "Foo", "Bar", "Baz" },
        },
        allow_caps_additions = {
          { "enable", "disable" },
        },
      })
    end,
  },
  {
    "numToStr/FTerm.nvim",
    config = function()
      require("FTerm").setup({
        border = "rounded",
        dimensions = {
          height = 0.9,
          width = 0.9,
        },
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
  {
    "Olical/conjure",
    ft = { "racket", "scheme" },
    lazy = true,
    init = function() end,
  },
  { "prisma/vim-prisma" },
  { "elkowar/yuck.vim" },
}
