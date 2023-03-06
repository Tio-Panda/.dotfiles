local packer = require('panda.packer')

return packer.startup(function(use)
    -- Core
    use { 'wbthomason/packer.nvim' }
    use { 'lewis6991/impatient.nvim' }

    -- File & Buffer Manager
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        }
    }
    use { 'nvim-tree/nvim-tree.lua', tag = 'nightly',
        requires = { 'nvim-tree/nvim-web-devicons' },
    }
    use { 'theprimeagen/harpoon' }

    -- Better read
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-treesitter/playground' }

    -- Edit Code
    use { 'mbbill/undotree' }
    use { 'numToStr/Comment.nvim' }
    use { 'chaoren/vim-wordmotion' }
    use { 'wellle/targets.vim' }
    use { 'kana/vim-textobj-user',
        requires = {
            { 'glts/vim-textobj-comment' },
            { 'kana/vim-textobj-datetime' },
            { 'jceb/vim-textobj-uri' },
            { 'kana/vim-textobj-indent' },
        }
    }
    -- hop.nvim

    -- Daily Utilities
    use { "folke/todo-comments.nvim",
        requires = { "nvim-lua/plenary.nvim" }
    }

    -- LSP & Autocompletion
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
            { 'hrsh7th/cmp-cmdline' },
            { 'petertriho/cmp-git' },
            { 'f3fora/cmp-spell' },
            { 'kdheepak/cmp-latex-symbols' },
            { 'zbirenbaum/copilot-cmp',             after = { 'copilot.lua' } },
            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
    use { 'onsails/lspkind.nvim' }
    use { 'folke/trouble.nvim' }
    use { "zbirenbaum/copilot.lua" }
    -- use { "github/copilot.vim" }

    -- DAP
    use { 'mfussenegger/nvim-dap' }
    use { 'rcarriga/nvim-dap-ui' }
    use { 'theHamsta/nvim-dap-virtual-text' }

    -- Git
    use { 'tpope/vim-fugitive' }
    use { 'lewis6991/gitsigns.nvim' }

    -- Terminal
    use { 'akinsho/toggleterm.nvim', tag = '*' }
    use { "alexghergh/nvim-tmux-navigation" }
    use { "Pocco81/true-zen.nvim" }
    -- use { "folke/zen-mode.nvim" }

    -- Editor UI
    use { 'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use { 'akinsho/bufferline.nvim', tag = "v3.*",
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    -- Startup
    use { "goolord/alpha-nvim",
        requires = { "nvim-tree/nvim-web-devicons" }
    }

    -- TODO: Agregar una funcion auxiliar que identifique si estamos en termux o en pc para activar o desactivar ciertos plugins

    -- Writting
    use { "epwalsh/obsidian.nvim" }
    use { "uga-rosa/translate.nvim" }
    -- use { "rhysd/vim-grammarous" } -- For LanguageTool (using ltex-ls currently)
end)
