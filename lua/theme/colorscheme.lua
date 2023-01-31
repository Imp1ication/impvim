-- Default colorscheme --
local colorscheme = "tokyonight"

-- Protected call --
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then 
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return 
end

-- Config -- 
-- tokyonight  
require("tokyonight").setup({
    style = "night", -- "storm", "moon", "night", "day"
    styles = {
        comments = { italic = true },
    }
})

-- gruvbox
require("gruvbox").setup({
})

-- sonokai
vim.g.sonokai_style = "shusia" -- "default", "atlantis", "andromeda", "shusia", "maia", "expresso"

-- vscode 
require("vscode").setup({
    italic_comments = true,
})



-- Put this at the end after all plugins --
vim.cmd("colorscheme " .. colorscheme)




