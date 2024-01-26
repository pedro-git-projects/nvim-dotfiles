vim.cmd [[packadd packer.nvim]]
-- remember to TSUpdate after updating treesitter

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { "ellisonleao/gruvbox.nvim" }
    use({ 'nvim-treesitter/nvim-treesitter' }, { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use('windwp/nvim-autopairs')
    use('lervag/vimtex')

    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua' -- recommended if need floating window support

    -- file explorer
    -- use {
    --     'nvim-tree/nvim-tree.lua',
    --     requires = {
    --         'nvim-tree/nvim-web-devicons', -- optional
    --     },
    -- }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- themes
    use "savq/melange-nvim"
    use {
        'luisiacc/gruvbox-baby',
        branch = 'main'
    }
    use { "kyoh86/momiji" }
    use { "xero/miasma.nvim" }
    use({
        'ramojus/mellifluous.nvim',
        config = function()
            require 'mellifluous'.setup({ --[[...]] }) -- optional, see configuration section.
        end,
    })

    use 'windwp/nvim-ts-autotag'
    use {
        'numToStr/Comment.nvim',
    }
    use { "jose-elias-alvarez/null-ls.nvim" }

    use {
        "ray-x/lsp_signature.nvim",
    }
    --[[     use { "hrsh7th/cmp-nvim-lsp-signature-help" } ]]
    --    use 'Olical/conjure'
    --[[  use({ "elixir-tools/elixir-tools.nvim", tag = "stable", requires = { "nvim-lua/plenary.nvim" } }) ]]

    use {
        'ms-jpq/chadtree',
        branch = 'chad',
        run = 'python3 -m chadtree deps'
    }

    use { "prisma/vim-prisma" }

    -- use {
    --     "pmizio/typescript-tools.nvim",
    --     requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    --     config = function()
    --         require("typescript-tools").setup {}
    --     end,
    -- }
    use {
        'akinsho/flutter-tools.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
    }
end)
