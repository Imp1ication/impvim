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

    lightbulb = {
        enable = false,
        enable_in_insert = false,
        sign = true,
        sign_priority = 40,
        virtual_text = false,
    },

    diagnostic = {
        show_code_action = true,
        show_source = true,
        jump_num_shortcut = true,
        --1 is max
        max_width = 0.7,
        custom_fix = nil,
        custom_msg = nil,
        text_hl_follow = false,
        keys = {
            exec_action = "o",
            quit = "q",
            go_action = "g"
        },
    },

    symbol_in_winbar = {
        enable = false,
        separator = " ",
        hide_keyword = false,
        show_file = true,
        folder_level = 2,
        respect_root = false,
        color_mode = true,
    },
})
