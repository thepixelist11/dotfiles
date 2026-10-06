return {
  "chomosuke/typst-preview.nvim",

  init = function()
    require("typst-preview").setup({
      invert_colors = "auto",
    })
  end,
}
