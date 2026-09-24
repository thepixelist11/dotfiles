return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--query-driver=/run/current-system/sw/bin/g++",
            "--background-index",
            "--experimental-modules-support",
          },
        },
        qmlls = {
          cmd = { "qmlls" },
        },
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                library = {
                  "/run/current-system/sw/share/hypr/stubs",
                },
                checkThirdParty = false,
              },
              diagnostics = {
                globals = { "hl" },
              },
            },
          },
        },
      },
    },
  },

  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<leader>me",
        function()
          require("telescope").extensions.metals.commands()
        end,
        desc = "Metals commands",
      },
      {
        "<leader>mc",
        function()
          require("metals").compile_cascade()
        end,
        desc = "Metals compile cascade",
      },
      {
        "<leader>mh",
        function()
          require("metals").hover_worksheet()
        end,
        desc = "Metals hover worksheet",
      },
    },
    ft = { "scala", "sbt", "java" },
    opts = function()
      local metals_config = require("metals").bare_config()

      metals_config.init_options.statusBarProvider = "off"

      metals_config.settings = {
        verboseCompilation = true,
        showImplicitArguments = true,
        showImplicitConversionsAndClasses = true,
        showInferredType = true,
        superMethodLensesEnabled = true,
        excludedPackages = {
          "akka.actor.typed.javadsl",
          "org.apache.pekko.actor.typed.javadsl",
          "com.github.swagger.akka.javadsl",
        },
        testUserInterface = "Test Explorer",
      }

      metals_config.on_attach = function(client, bufnr) end

      return metals_config
    end,
    config = function(self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end,
  },
}
