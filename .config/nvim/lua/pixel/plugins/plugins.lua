-- This file is for smaller plugins that don't need much config

package.path = package.path .. ';' .. vim.fn.expand '$HOME' .. '/.luarocks/share/lua/5.1/?/init.lua'
package.path = package.path .. ';' .. vim.fn.expand '$HOME' .. '/.luarocks/share/lua/5.1/?.lua'

return {

  { 'tpope/vim-sleuth' },

  { 'numToStr/Comment.nvim' },

  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { 'barrett-ruth/live-server.nvim', opts = { args = { '--port=8080', '--browser=firefox' } } },

  { 'jghauser/follow-md-links.nvim' },

  { 'nfrid/markdown-togglecheck', dependencies = { 'nfrid/treesitter-utils' }, ft = { 'markdown' } },

  {
    'Myzel394/easytables.nvim',
    config = function()
      require('easytables').setup {}
    end,
  },

  { 'akinsho/git-conflict.nvim', version = '*', config = true },

  { 'nvim-treesitter/nvim-treesitter-context', opts = {} },

  { 'Sirver/ultisnips', event = { 'InsertEnter' } },

  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },

  -- {
  --   '3rd/image.nvim',
  --   config = function()
  --     local image = require 'image'
  --     image.setup()
  --   end,
  -- },

  {
    'ryleelyman/latex.nvim',
    config = function()
      require('latex').setup {}
    end,
  },

  {
    'bullets-vim/bullets.vim',
    ft = { 'markdown', 'text', 'gitcommit' },
  },

  {
    'lervag/vimtex',
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.vimtex_view_automatic = 1
      vim.g.vimtex_compiler_latexmk = {
        build_dir = '',
        callback = 1,
        continuous = 1, -- Enables automatic recompilation on file save
        executable = 'latexmk',
        options = {
          '-shell-escape',
          '-verbose',
          '-file-line-error',
          '-synctex=1',
          '-interaction=nonstopmode',
        },
      }
    end,
  },

  {
    'Fildo7525/pretty_hover',
    event = 'LspAttach',
    opts = {},
  },

  {
    'numToStr/FTerm.nvim',
    config = function()
      require('FTerm').setup {
        border = 'rounded',
        dimensions = {
          height = 0.9,
          width = 0.9,
        },
      }
    end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
    config = function()
      require('ibl').setup()
    end,
  },

  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup {}
    end,
  },

  {
    'theHamsta/nvim-dap-virtual-text',
    config = function()
      require('nvim-dap-virtual-text').setup {
        virt_text_win_col = 80,
      }
    end,
  },

  {
    'folke/zen-mode.nvim',
    opts = {
      window = {
        backdrop = 1,
        width = 100,
        height = 1,
        options = {
          signcolumn = 'no',
          number = false,
          -- relativenumber = true,
          cursorline = true,
          cursorcolumn = false,
          foldcolumn = '0',
          list = false,
        },
      },
      plugins = {
        options = {
          enabled = true,
        },
      },
    },
  },

  {
    'jakemason/ouroboros.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },

  {
    'monaqa/dial.nvim',
  },

  {
    'jiaoshijie/undotree',
    dependencies = 'nvim-lua/plenary.nvim',
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { '<leader>u', "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },

  {
    'xiyaowong/transparent.nvim',
    lazy = false,
    config = function()
      require('transparent').setup {
        extra_groups = { 'CmpPmenu', 'Pmenu' },
        exclude_groups = { 'CursorLine' },
      }
    end,
  },

  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'VeryLazy',
    priority = 1000,
    config = function()
      vim.diagnostic.config { virtual_text = false }
      require('tiny-inline-diagnostic').setup {}
    end,
  },

  {
    'lewis6991/gitsigns.nvim',
    event = 'VimEnter',
    config = function()
      vim.api.nvim_set_hl(0, 'SignColumn', { clear })
      require('gitsigns').setup {
        signs = {
          add = { text = '┃' },
          change = { text = '┃' },
          delete = { text = '┃' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
          untracked = { text = '┆' },
        },
      }
    end,
  },

  {
    'uga-rosa/ccc.nvim',
    config = function()
      local ccc = require 'ccc'
      local mapping = ccc.mapping

      ccc.setup {
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
        inputs = {
          ccc.input.rgb,
          ccc.input.hsl,
          ccc.input.cmyk,
          ccc.input.oklab,
        },
      }
    end,
  },

  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {
        autotag = {
          enable = true,
        },
      }
    end,
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup {
        disable_filetype = { 'TelescopePrompt', 'vim' },
      }
    end,
  },

  {
    'meznaric/key-analyzer.nvim',
    opts = {},
  },

  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      vim.o.foldcolumn = '1'
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

      vim.keymap.set('n', 'zO', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zC', require('ufo').closeAllFolds)

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      local language_servers = vim.lsp.get_clients()
      for _, ls in ipairs(language_servers) do
        require('lspconfig')[ls].setup {
          capabilities = capabilities,
        }
      end
      require('ufo').setup()
    end,
  },

  -- {
  --   '3rd/image.nvim',
  --   config = function()
  --     require('image').setup {
  --       backend = 'kitty',
  --       integrations = {
  --         markdown = {
  --           enabled = true,
  --           clear_in_insert_mode = false,
  --           download_remote_images = true,
  --           only_render_image_at_cursor = false,
  --           floating_windows = false,
  --           filetypes = { 'markdown' },
  --         },
  --         neorg = {
  --           enabled = true,
  --           filetypes = { 'norg' },
  --         },
  --       },
  --       max_width = nil,
  --       max_height = nil,
  --       max_width_window_percentage = nil,
  --       max_height_window_percentage = 50,
  --       window_overlap_clear_enabled = false,
  --       window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', 'snacks_notif', 'scrollview', 'scrollview_sign' },
  --       editor_only_render_when_focused = false,
  --       tmux_show_only_in_active_window = false,
  --       hijack_file_patterns = { '*.png', '*.jpg', '*.jpeg', '*.gif', '*.webp', '*.avif' },
  --     }
  --   end,
  -- },

  -- {
  --   'nvim-neorg/neorg',
  --   lazy = false,
  --   version = '*',
  --   config = function()
  --     local norg = require 'neorg'
  --     norg.setup {
  --       load = {
  --         ['core.defaults'] = {},
  --         ['core.concealer'] = {},
  --         ['core.latex.renderer'] = {},
  --       },
  --     }
  --   end,
  -- },
}
