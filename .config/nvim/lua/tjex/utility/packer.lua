local ok, _ = pcall(require, "packer")
if not ok then
    print('packer not ok!')
    return
end
-- required as I have packer configured as `opt`
-- vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- never remove
    use({
        "wbthomason/packer.nvim",
        "nvim-lua/plenary.nvim",
        'nvim-tree/nvim-web-devicons',
        {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end,
            dependencies = {
                'JoosepAlviste/nvim-ts-context-commentstring',
            },
        },
    })

    -- GUI
    use({
        "nvim-tree/nvim-tree.lua",
        { "rose-pine/neovim",          as = 'rose-pine' },
        { "jesseleite/nvim-noirbuddy", requires = { "tjdevries/colorbuddy.nvim", branch = "dev" } },
        'lukas-reineke/indent-blankline.nvim',
    })

    -- text
    use({
        "junegunn/vim-easy-align",
        "windwp/nvim-autopairs",
        "numToStr/Comment.nvim",
        { "danymat/neogen", tag = "*" },
        {
            "kylechui/nvim-surround",
            tag = "*", -- Use for stability; omit to use `main` branch for the latest features
            config = function()
                require("nvim-surround").setup({})
            end
        }
    })

    -- utility
    use({
        "ThePrimeagen/harpoon",
        "tpope/vim-fugitive",
        { "nvim-telescope/telescope.nvim",            tag = "0.1.0" },
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        "nvim-telescope/telescope-dap.nvim",
        "christoomey/vim-tmux-navigator",
        "ton/vim-bufsurf",
    })

    -- dap
    use({
        "mfussenegger/nvim-dap",
        "mxsdev/nvim-dap-vscode-js",
        "rcarriga/nvim-dap-ui",
        "leoluz/nvim-dap-go",
        opt = true,
        cmd = { 'Dapui' },
    })

    -- lsp
    use({
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    })
end)
