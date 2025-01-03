local lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Setup mason-lspconfig
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "tsserver",
        "pyright",
        "html",
        "cssls",
    },
    automatic_installation = true,
})

-- Lua LSP settings
lsp.lua_ls.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
})

-- TypeScript
lsp.tsserver.setup({
    capabilities = capabilities,
})

-- Python
lsp.pyright.setup({
    capabilities = capabilities,
})

-- HTML
lsp.html.setup({
    capabilities = capabilities,
})

-- CSS
lsp.cssls.setup({
    capabilities = capabilities,
})

-- Global mappings
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: Rename" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code action" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "LSP: Go to references" })
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "LSP: Go to implementation" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover documentation" })
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "LSP: Signature help" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic error messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

-- Diagnostic configuration
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})
