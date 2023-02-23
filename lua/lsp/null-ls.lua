local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	vim.notify("Error from null-ls!")
	return
end

local formatting = null_ls.builtins.formatting
local daignostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		--[[
        formatting.stylua,
        formatting.prettier,
        diagnostics,eslint_d,
    --]]
	},
})
