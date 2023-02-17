local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    vim.notify("Error from cmp!")
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    vim.notify("Error from luasnip!")
    return
end

local lspkind_status_ok, _ = pcall(require, "lspkind")
if not lspkind_status_ok then
    vim.notify("Error from lspkind!")
    return
end

require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = { "menu", "menuone", "noselect" }

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local border_style = {
    ["none"] = {},
    ["default"] = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
    ["bold"] = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
    ["double"] = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" },
    ["round"] = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
}

-- Config --
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },

    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<leader>e"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },

        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm { select = true },

        -- Super Tab
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },

--[[
    formatting = {
        format = lspkind.cmp_format({
            -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            maxwidth = 30,
            ellipsis_char = "...",
            mode = "symbol_text", -- "text", "test_symbol", "symbol_text", "symbol"
            menu = ({
                nvim_lsp = "(lsp)",
                luasnip = "(snippet)",
                buffer = "(buffer)",
                path = "(path)",
            }),
        }),
    },
--]]
    formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, vim_item)
            -- kind
            local kind_icons = {
                Text = "",
                Method = "m",
                Function = "",
                Constructor = "",
                Field = "",
                Variable = "",
                Class = "",
                Interface = "",
                Module = "",
                Property = "",
                Unit = "",
                Value = "",
                Enum = "",
                Keyword = "",
                Snippet = "",
                Color = "",
                File = "",
                Reference = "",
                Folder = "",
                EnumMember = "",
                Constant = "",
                Struct = "",
                Event = "",
                Operator = "",
                TypeParameter = "",
            } --   פּ ﯟ    some other good icons

            vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)

            -- abbr
            local abbr_opt = {
                maxwidth = 30,
                ellipsis_char = "...",
            }

            if abbr_opt.maxwidth ~= nil then
                if abbr_opt.ellipsis_char == nil then
                    vim_item.abbr = string.sub(vim_item.abbr, 1, abbr_opt.maxwidth)
                else
                    local label = vim_item.abbr
                    local truncated_label = vim.fn.strcharpart(label, 0, abbr_opt.maxwidth)
                    if truncated_label ~= label then
                        vim_item.abbr = truncated_label .. abbr_opt.ellipsis_char
                    end
                end
            end

            -- menu
            vim_item.menu = ({
                nvim_lsp = "(lsp)",
                luasnip = "(snippet)",
                buffer = "(buffer)",
                path = "(path)",
            })[entry.source.name]

            return vim_item
        end,
    },

    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },

    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },

    window = {
        completion = {
            border = border_style["round"],
            scrollbar = false,
        },
        documentation = {
            border = border_style["round"],
            scrollbar = true,
        },
    },

    experimental = {
        ghost_text = true,
        native_menu = false,
    },
}
