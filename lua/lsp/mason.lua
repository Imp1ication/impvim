local mason_status_ok, _ = pcall(require, "mason")
if not mason_status_ok then 
    vim.notify("Error from mason!")
    return 
end

local mason_lspconfig_status_ok, _ = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then 
    vim.notify("Error from mason-lspconfig!")
    return 
end

-- Setup mason and mason-lspconfig -- 
require("mason").setup()
require("mason-lspconfig").setup({
    -- list of servers for mason to install 
    ensure_installed = {
        "sumneko_lua",
        "jsonls",
        "clangd",
    },

    automatic_installation = true, -- auto-install configured servers with lspconfig
})



