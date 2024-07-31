-- ;Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Enable 24-bit color
vim.opt.termguicolors = true

-- Disable netrw in favour of nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 15

vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.opt.lbr = true
vim.opt.wrap = true

-- Open a scratch buffer
vim.api.nvim_create_user_command('Scratch', function()
  vim.cmd 'enew'
  vim.bo.buftype = 'nofile'
  vim.bo.bufhidden = 'hide'
  vim.bo.swapfile = false
end, {})

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>se', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<leader>lss', ':LiveServerStart<CR>', { noremap = true })
vim.keymap.set('n', '<leader>mdp', ':MarkdownPreview<CR>', { noremap = true })

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true })

-- Allows for using dd for deleting without yanking and Rd to delete with yanking
vim.keymap.set('n', 'd', '"_d', { noremap = true })
vim.keymap.set('n', 'R', '"1d', { noremap = true })

-- Quit neovim with XF86AudioStop
vim.keymap.set('n', '', ':qa!<CR>', { noremap = true })

-- Yank to system clipboard
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true })

-- Prettier current file
vim.api.nvim_set_keymap(
  'n',
  '<Leader>p',
  [[:lua vim.cmd('!' .. 'prettier --write ' .. vim.fn.shellescape(vim.fn.expand('%:p')))<CR>]],
  { noremap = true, silent = true }
)

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Do not yank on X
vim.keymap.set('n', 'x', ':normal! "_x<CR>', { noremap = true, silent = true })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window', silent = true })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window', silent = true })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window', silent = true })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window', silent = true })

vim.keymap.set('n', '<A-j>', ':m .+1<CR>==') -- Move line up
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==') -- Move line down
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv") -- Move line up
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv") -- Move line down

-- Move within wrapped lines
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Move faster
vim.keymap.set('n', '<C-h>', '5h', { noremap = true })
vim.keymap.set('n', '<C-j>', '5j', { noremap = true })
vim.keymap.set('n', '<C-k>', '5k', { noremap = true })
vim.keymap.set('n', '<C-l>', '5l', { noremap = true })

vim.keymap.set('v', '<C-h>', '5h', { noremap = true })
vim.keymap.set('v', '<C-j>', '5j', { noremap = true })
vim.keymap.set('v', '<C-k>', '5k', { noremap = true })
vim.keymap.set('v', '<C-l>', '5l', { noremap = true })

-- Open new instance of kitty in same directory
vim.keymap.set('n', '<leader>cpk', ':!kitty $(pwd) &<CR><CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>fr', ':%s///g<Left><Left><Left>', { noremap = true, silent = false })

-- Create terminal split
vim.keymap.set('n', '<leader>t', ':split | term<CR>', { noremap = true })

-- Open link
vim.api.nvim_set_keymap('n', 'gx', [[:silent execute '!firefox ' . shellescape(expand('<cfile>'), 1)<CR>]], { noremap = true })

-- Swap between c(pp) and h
vim.api.nvim_set_keymap('n', '<leader>gh', ':ClangdSwitchSourceHeader<CR>', { noremap = true, silent = true })

function GoogleSearch()
  local searchterm = vim.fn.getreg 'g'
  local url = 'http://google.com/search?q=' .. searchterm
  vim.fn.system { 'firefox', url }
end
vim.api.nvim_set_keymap('v', '<leader>gg', '"gy<Esc>:lua GoogleSearch()<CR>', { noremap = true, silent = true })

vim.keymap.set('i', '<F3>', function()
  require('lsp_signature').toggle_float_win()
end, { silent = true, noremap = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- local projectfile = vim.fn.getcwd() .. '/project.godot'
-- if projectfile then
--   vim.fn.serverstart './godothost'
-- end

-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  { 'numToStr/Comment.nvim', opts = {} },

  {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
    opts = {
      hint_prefix = ' ',
      floating_window = false,
    },
    config = function(_, opts)
      require('lsp_signature').setup(opts)
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
    'rmagatti/alternate-toggler',
    config = function()
      require('alternate-toggler').setup {
        alternates = {
          ['=='] = '!=',
          ['.'] = ',',
          ['let'] = 'var',
          ['on'] = 'off',
          ['+='] = '-=',
        },
      }
      vim.keymap.set('n', '<leader>b', "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>")
    end,
  },

  { 'barrett-ruth/live-server.nvim', opts = { args = { '--port=8080', '--browser=firefox' } } },

  -- {
  --   'RaafatTurki/hex.nvim',
  --   config = function()
  --     require('hex').setup()
  --   end,
  -- },

  { -- Adds git related signs to the gutter, as well as utilities for managing changes
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

  { -- Hyprland config file
    'theRealCarneiro/hyprland-vim-syntax',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = 'hypr',
  },

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`

      -- Define a custom function to list directories

      -- Map the custom picker to a keybinding
      vim.api.nvim_set_keymap('n', '<leader>fd', "<cmd>lua require('telescope').extensions.custom_dirs()<CR>", { noremap = true, silent = true })

      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>st', builtin.builtin, { desc = '[S]earch Select [T]elescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>ss', builtin.lsp_workspace_symbols, { desc = '[S]earch [S]ymbols' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      { 'j-hui/fidget.nvim', opts = {
        notification = {
          window = {
            normal_hl = 'NormalNC',
          },
        },
      } },

      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that Lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

          -- Opens a popup that displays documentation about the word under your cursor
          --  See `:help K` for why this keymap.
          map('K', vim.lsp.buf.hover, 'Hover Documentation')

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
      require('lspconfig').gdscript.setup(capabilities)

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        gopls = {},
        html = {},
        cssls = {},
        emmet_language_server = {},
        eslint = {},
        jsonls = {},
        tsserver = {},
        bashls = {},
        clangd = {
          cmd = { 'clangd', '--header-insertion=never' },
          filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
          root_dir = function()
            return vim.loop.cwd()
          end,
          single_file_support = true,
        },

        lua_ls = {
          -- cmd = {...},
          -- filetypes = { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
      }

      require('mason').setup {}

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  { 'habamax/vim-godot', event = 'VimEnter' },

  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        js = { 'prettier' },
        ts = { 'prettier' },
        json = { 'prettier' },
        asm = { 'asmfmt' },
        html = { 'prettier' },
        c = { 'clang-format' },
        cpp = { 'clang-format' },
      },
    },
  },
  {
    'goolord/alpha-nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local dashboard = require 'alpha.themes.dashboard'

      dashboard.section.buttons.val = {
        dashboard.button('n', '  New file', ':ene<CR>'),
        dashboard.button('f', '  Find file', ':cd $HOME | silent Telescope find_files hidden=true no_ignore=true <CR>'),
        dashboard.button('t', '  Find text', ':Telescope live_grep <CR>'),
        dashboard.button('r', '󰄉  Recent files', ':Telescope oldfiles <CR>'),
        dashboard.button('p', '  Projects', ':e $HOME/Documents/programming <CR>'),
        dashboard.button('c', '  Config', ':e $HOME/.config/nvim/init.lua<CR>'),
        dashboard.button('u', '󱐥  Update plugins', '<cmd>Lazy update<CR>'),
        -- dashboard.button('d', '󱗼  Dotfiles', ':e $HOME/dotfiles <CR>'),
        dashboard.button('q', '󰿅  Quit', '<cmd>qa<CR>'),
      }

      -- helper function for utf8 chars
      local function getCharLen(s, pos)
        local byte = string.byte(s, pos)
        if not byte then
          return nil
        end
        return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
      end

      local function applyColors(logo, colors, logoColors)
        dashboard.section.header.val = logo

        for key, color in pairs(colors) do
          local name = 'Alpha' .. key
          vim.api.nvim_set_hl(0, name, color)
          colors[key] = name
        end

        dashboard.section.header.opts.hl = {}
        for i, line in ipairs(logoColors) do
          local highlights = {}
          local pos = 0

          for j = 1, #line do
            local opos = pos
            pos = pos + getCharLen(logo[i], opos + 1)

            local color_name = colors[line:sub(j, j)]
            if color_name then
              table.insert(highlights, { color_name, opos, pos })
            end
          end

          table.insert(dashboard.section.header.opts.hl, highlights)
        end
        return dashboard.opts
      end

      require('alpha').setup(applyColors({
        [[  ███       ███  ]],
        [[  ████      ████ ]],
        [[  ████     █████ ]],
        [[ █ ████    █████ ]],
        [[ ██ ████   █████ ]],
        [[ ███ ████  █████ ]],
        [[ ████ ████ ████ ]],
        [[ █████  ████████ ]],
        [[ █████   ███████ ]],
        [[ █████    ██████ ]],
        [[ █████     █████ ]],
        [[ ████      ████ ]],
        [[  ███       ███  ]],
        [[                    ]],
        [[  N  E  O  V  I  M  ]],
      }, {
        ['b'] = { fg = '#3399ff', ctermfg = 33 },
        ['a'] = { fg = '#53C670', ctermfg = 35 },
        ['g'] = { fg = '#39ac56', ctermfg = 29 },
        ['h'] = { fg = '#33994d', ctermfg = 23 },
        ['i'] = { fg = '#33994d', bg = '#39ac56', ctermfg = 23, ctermbg = 29 },
        ['j'] = { fg = '#53C670', bg = '#33994d', ctermfg = 35, ctermbg = 23 },
        ['k'] = { fg = '#30A572', ctermfg = 36 },
      }, {
        [[  kkkka       gggg  ]],
        [[  kkkkaa      ggggg ]],
        [[ b kkkaaa     ggggg ]],
        [[ bb kkaaaa    ggggg ]],
        [[ bbb kaaaaa   ggggg ]],
        [[ bbbb aaaaaa  ggggg ]],
        [[ bbbbb aaaaaa igggg ]],
        [[ bbbbb  aaaaaahiggg ]],
        [[ bbbbb   aaaaajhigg ]],
        [[ bbbbb    aaaaajhig ]],
        [[ bbbbb     aaaaajhi ]],
        [[ bbbbb      aaaaajh ]],
        [[  bbbb       aaaaa  ]],
        [[                    ]],
        [[  a  a  a  b  b  b  ]],
      }))
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {}
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Scroll the documentation window [b]ack / [f]orward
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['<S-TAB>'] = cmp.mapping.confirm { select = true },

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },

  {
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'marko-cerovac/material.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme 'material-darker'
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  -- {
  --   'rebelot/kanagawa.nvim',
  --   priority = 1000, -- Make sure to load this before all the other start plugins.
  --   init = function()
  --     vim.cmd.colorscheme 'kanagawa'
  --     vim.cmd.hi 'Comment gui=none'
  --   end,
  -- },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { 'windwp/nvim-autopairs', event = 'InsertEnter', config = true },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- local statusline = require 'mini.statusline'
      -- statusline.setup { use_icons = vim.g.have_nerd_font }
      -- ---@diagnostic disable-next-line: duplicate-set-field
      -- statusline.section_location = function()
      --   return '%2l:%-2v'
      -- end
    end,
  },
  {
    'xiyaowong/transparent.nvim',
    lazy = false,
    config = function()
      require('transparent').setup()
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'gdscript', 'godot_resource', 'gdshader', 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc', 'javascript', 'go' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby', 'gdscript', 'html' } },
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)

      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },
  {
    'simrat39/rust-tools.nvim',
    config = function()
      local rt = require 'rust-tools'
      rt.setup {
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set('n', '<C-space>', rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set('n', '<Leader>a', rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      }
    end,
  },
  {
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
              padding = 'center', -- Uncomment for extra padding.
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
  },

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- Find directories
local telescope = require 'telescope'
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'
telescope.extensions.custom_dirs = function(opts)
  opts = opts or {}

  require('telescope.builtin').find_files {
    prompt_title = 'Directories',
    find_command = { 'fd', '--type', 'd', '--hidden', '--no-ignore' },
    attach_mappings = function(prompt_bufnr, map)
      local select_dir = function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        vim.cmd('cd ' .. selection.path)
        vim.cmd 'NvimTreeToggle'
      end
      map('i', '<CR>', select_dir)
      map('n', '<CR>', select_dir)
      return true
    end,
  }
end

-- Remove _ from iskeyword
local iskeyword = vim.opt.iskeyword:get()
for i, v in ipairs(iskeyword) do
  if v == '_' then
    table.remove(iskeyword, i)
    break
  end
end
vim.opt.iskeyword = iskeyword

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
