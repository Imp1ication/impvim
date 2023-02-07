local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
    vim.notify("Error from lspsaga!")
    return
end

saga.setup({
    -- lsp finder setup 
    finder = {
        max_height = 0.5,

        keys = {
            edit = { "<CR>", "e" },
            vsplit = "v",
            split = "s",
            tabe = "t",
            quit = { "<ESC>", "q" },
            close_in_preview = "<ESC>"
        },
    },

    -- peek definition setup
    definition = {
        edit = "<Cr>",
        vsplit = "<C-c>v",
        split = "<C-c>s",
        tabe = "<C-c>t",
        quit = "q",
        close = "<Esc>",
    },

    code_action = {
        num_shortcut = true,
        show_server_name = false,
        keys = {
            quit = "q",
            exec = "<CR>",
        },
    },

    rename = {
        quit = "<Esc>",
        exec = "<Cr>"
    },

    lightbulb = {
        enable = false,
        enable_in_insert = false,
        sign = true,
        sign_priority = 40,
        virtual_text = false,
    },

    symbol_in_winbar = {
        enable = false,
        separator = " ",
        hide_keyword = false,
        show_file = false,
        folder_level = 2,
        respect_root = false,
        color_mode = false,
    },
})
