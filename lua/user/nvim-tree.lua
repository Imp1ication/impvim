local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
	sort_by = "name", -- "name", "case_sensitive", "modification_time", "extension"

	view = {
		side = "left", -- "left", "right"
		hide_root_folder = false,
		cursorline = true,
		signcolumn = "yes", -- "yes", "auto", "no"

		adaptive_size = true,
		width = {
			min = 20,
			max = 40,
		},

		mappings = {
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "s", cb = tree_cb("split") },
				{ key = "v", cb = tree_cb("vsplit") },
			},
		},
	},

	renderer = {
	--	root_folder_modifier = ":t",
		group_empty = true,
		full_name = true,

		highlight_git = false,

		indent_width = 2,
		indent_markers = {
			enable = true,
			inline_arrows = true,
		},

		icons = {
			show = {
				git = false,
				file = true,
				folder = true,
				folder_arrow = true,
			},

			-- git_placement = "after", -- "after", "before", "signcolumn"
			glyphs = {
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},

        special_files = {
            "Cargo.toml",
            "Makefile",
            "README.md",
            "readme.md",
        },
	},

    filters = {
        dotfiles = false,
        git_clean = false,
        custom = {
            "*.meta",
        },

        -- Overrides "git.ignore", "filters.dotfiles", and "filters.custom"
        exclude = {
            "git.ignore"
        },

    },

    actions = {
        open_file = {
            quit_on_open = true,
            resize_window = false,
            window_picker = {
                enable = true,
                picker = "default",
                chars = "QWERTYUIOPASDFGHJKLZXCVBNM"
            },
        },
    },

	update_focused_file = {
		enable = true,
		update_root = true,
	},

	diagnostics = {
		enable = true,
		show_on_dirs = true,
        show_on_open_dirs = false,

		icons = {
			hint = "ﴞ",
			info = "",
			warning = "",
			error = "",
		},
	},

    git = {
        enable = false,
        ignore = false,
        show_on_dirs = false,
        show_on_open_dirs =  false,
    },
})
