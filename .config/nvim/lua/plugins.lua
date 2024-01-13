local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup({
	-- COLORSCHEME
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = true
	},
	-- DASHBOARD
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			-- Set header
			dashboard.section.header.val = {
				"          **     ******     *******   ******       **        ",
				"         ****   /*////**   **/////** /*////**     ****       ",
				"        **//**  /*   /**  **     //**/*   /**    **//**      ",
				"       **  //** /******  /**      /**/******    **  //**     ",
				"      **********/*//// **/**      /**/*//// ** **********    ",
				"     /**//////**/*    /**//**     ** /*    /**/**//////**    ",
				"     /**     /**/*******  //*******  /******* /**     /**    ",
				"     //      // ///////    ///////   ///////  //      //     ",
				" ****     ** ********   *******   **      ** ** ****     ****",
				"/**/**   /**/**/////   **/////** /**     /**/**/**/**   **/**",
				"/**//**  /**/**       **     //**/**     /**/**/**//** ** /**",
				"/** //** /**/******* /**      /**//**    ** /**/** //***  /**",
				"/**  //**/**/**////  /**      /** //**  **  /**/**  //*   /**",
				"/**   //****/**      //**     **   //****   /**/**   /    /**",
				"/**    //***/******** //*******     //**    /**/**        /**",
				"//      /// ////////   ///////       //     // //         // ",
			}

			-- Set menu
			dashboard.section.buttons.val = {
				dashboard.button("n", "📁 > New file", ":ene<CR>"),
				dashboard.button("f", "🔎 > Find file", ":Telescope find_files<CR>"),
				dashboard.button("r", "📝 > Recent", ":Telescope oldfiles<CR>"),
				dashboard.button("l", "🔎 > Live Grep", ":Telescope live_grep<CR>"),
			}

			-- Send config to alpha
			alpha.setup(dashboard.opts)

			-- Disable folding on alpha buffer
			vim.cmd([[
							autocmd FileType alpha setlocal nofoldenable
					]])
		end
	},
	-- BUFFERLINE
	{
		{
			"willothy/nvim-cokeline",
			dependencies = {
				"nvim-lua/plenary.nvim",    -- Required for v0.4.0+
				"kyazdani42/nvim-web-devicons", -- If you want devicons
				"stevearc/resession.nvim"   -- Optional, for persistent history
			},
			config = true
		}
	},
	-- LSP-ZERO
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x'
	},
	{ 'neovim/nvim-lspconfig' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'L3MON4D3/LuaSnip' },
	{ 'saadparwaiz1/cmp_luasnip' },
	-- LSP LANGUAGES
	{ 'simrat39/rust-tools.nvim' },
	-- LSP-RELATED
	{ 'mfussenegger/nvim-dap' },
	{ "barreiroleo/ltex-extra.nvim" },
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" }
	},
	-- OTHERS
	{
		"nvim-treesitter/nvim-treesitter",
		build = { ":TSUpdate", ":TSInstall all" }
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		'numToStr/Comment.nvim',
		lazy = false
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup()
		end
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
		config = function()
			vim.g.mkdp_auto_close = 0
		end
	}
})
