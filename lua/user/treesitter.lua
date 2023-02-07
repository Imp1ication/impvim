local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not status_ok then
    return
end

treesitter.setup({
    ensure_installed = {
        "c", "lua", "vim", "help",
        "bash",
        "json",
        "python",
        "markdown", "markdown_inline",

        "cpp", "cmake",
    },

    ignore_install = {},

    auto_install = true,

    highlight = {
        enable = true, -- false will disable the whole extension
        disable = {}, -- list of language that will be disabled
        additional_vim_regex_highlighting = false,
    },

    indent = { enable = true, disable = {} },

    -- nvim-ts-rainbow
    rainbow = {
        enable = true,
        disable = {},
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },

    -- nvim-autopair
    autopairs = { enable = true },

    -- nvim-ts-autotag
    autotag = { enable = true },
})
