local lsp = require("lsp-zero")
local cmp = require('cmp')

local function on_attach(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

-- Set up LSP and Pyright
lsp.preset("recommended")
lsp.ensure_installed({
    'tsserver',
    'gopls',
    'pyright',
    'clangd',
    'rust_analyzer',
    'zls',
})

lsp.nvim_workspace()
lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

-- Set up cmp mappings for completion
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    --[[ ['<S-k>'] = cmp.mapping.select_prev_item(cmp_select), ]]
    --[[ ['<S-j>'] = cmp.mapping.select_next_item(cmp_select), ]]
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

-- Set up nvim-cmp
lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

-- Set up LSP for gopls and Pyright
lsp.setup({
    gopls = {
        on_attach = on_attach,
        cmd = { "gopls" },
        settings = {
            gopls = {
                completeUnimported = true,
                usePlaceholders = true,
                analyses = {
                    unusedparams = true
                },
            },
        },
    },
    pyright = {
        on_attach = on_attach,
        settings = {
            python = {
                analysis = {
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                    diagnosticMode = "workspace",
                },
                autoImportCompletions = true,
            },
        },
    },
    rust_analyzer = {
        on_attach = on_attach,
    },
    zls = {
        on_attach = on_attach,
    }
})

-- Configure diagnostic display
vim.diagnostic.config({
    virtual_text = true
})
