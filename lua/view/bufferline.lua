local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	vim.notify("Error from bufferline")
	return
end

-- vim.opt.termguicolors = true

bufferline.setup({
	options = {
		numbers = "none", -- "none", "ordinal", "buffer_id", "both", function({ ordinal, id, lower, raise }): string
		-- Mouse actions
		close_command = "Bdelete! %d",
		right_mouse_command = "Bdelete! %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,

		indicator = {
			style = "icon", -- "icon", "underline", "none"
			icon = "▎", -- this should be omitted if indicator style is not "icon"
		},

		max_name_length = 20,
		tab_size = 20,

		-- Diagnostics
		diagnostics = "nvim_lsp", -- false, "nvim_lsp", "coc"
		diagnostics_update_in_insert = true,
		diagnostics_indicator = function(_, _, diagnostics_dict, _)
            local key = "none"
            for i, _ in pairs(diagnostics_dict) do
                if i == "error" then key = "error"
                elseif key ~= "error" and i == "warning" then key = "warning"
                elseif key == "none" then key = i
                end
            end

			local icon = (key == "error" and " " or (key == "warning" and " " or "󰠠 "))
			return "" .. icon .. diagnostics_dict[key]
		end,

		offsets = {
			{
				filetype = "NvimTree",
				text = function()
					return string.gsub(vim.fn.getcwd(), "/home/implication", "~", 1)
				end, -- set hide root in nvim tree
				text_align = "left", -- "left", "center", "right"
				highlight = "Directory",
			},
		},

		color_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		persist_buffer_sort = true,
		always_show_bufferline = true,
		separator_style = "slant", -- "slant", "thick", "thin"
	},
})
