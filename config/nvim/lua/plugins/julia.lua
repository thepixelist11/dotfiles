return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        julials = {
          mason = false,
          cmd = {
            "julia",
            "--startup-file=no",
            "--history-file=no",
            "-e",
            [[
              using LanguageServer, SymbolServer
              depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
              project_path = dirname(something(
                Base.current_project(),
                Base.load_path_expand("@v#.#")
              ))
              server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path)
              server.runlinter = true
              run(server)
            ]],
          },
          filetypes = { "julia" },
          root_markers = { "Project.toml", "JuliaProject.toml", "Manifest.toml", ".git" },
        },
      },
    },
  },
  {
    "klafyvel/nvim-smuggler",
    config = function()
      require("smuggler").setup()

      vim.keymap.set("x", "<leader>cs", ":SmuggleVisual<CR>", {
        desc = "Smuggle Visual Selection",
      })

      vim.keymap.set("n", "<leader>cs", ":.SmuggleRange<CR>", {
        desc = "Smuggle Current Line",
      })
    end,
    dependencies = { "nvim-neotest/nvim-nio" },
  },
}
