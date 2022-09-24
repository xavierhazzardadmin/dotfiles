vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- Package manager
	use 'ray-x/go.nvim'
	use 'ray-x/guihua.lua'
	use 'vijaymarupudi/nvim-fzf'
	use 'morhetz/gruvbox'
	use 'https://github.com/ctrlpvim/ctrlp.vim.git'
	use 'sheerun/vim-polyglot' --various language syntax support 
   	use 'mhinz/vim-startify'
	use 'nvim-lualine/lualine.nvim'
   	use 'kyazdani42/nvim-tree.lua' --lua nerdree but better i guess
    use { 'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
	use 'kyazdani42/nvim-web-devicons'
	use 'windwp/nvim-autopairs'
	use 'tpope/vim-surround'
	use 'fladson/vim-kitty'
	use 'Rigellute/shades-of-purple.vim'
	use 'dgryski/vim-godef'
	use 'tpope/vim-commentary'
	use 'mfussenegger/nvim-dap'
	use { 'jose-elias-alvarez/null-ls.nvim', requires = { 'nvim-lua/plenary.nvim' } }
	use 'mfussenegger/nvim-lint'
	use 'mhartington/formatter.nvim'

	use {
        	'nvim-treesitter/nvim-treesitter',
        	run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    	}
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use 'theHamsta/nvim-dap-virtual-text'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'Raimondi/delimitMate'

end)

