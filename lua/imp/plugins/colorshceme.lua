local colorscheme = "kanagawa"

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night", -- "storm", "moon", "night", "day"
      })

      vim.cmd.colorscheme(colorscheme)
    end,
  }, 
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        background = {
          dark = "wave", -- "wave", "dragon", "lotus"
          light = "lotus",
        }
      })
    end,
  },
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      -- default, atlantis, anfromeda, shusia, maia, expresso
      vim.g.sonokai_style = "shusia"
    end,
  },
  { 
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
  },
  { 
    "oxfist/night-owl.nvim",
    lazy = false,
    priority = 1000,
  }
}
