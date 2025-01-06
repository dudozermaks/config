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
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup({

				options = {
					icons_enabled = true,
					theme = 'auto',
					component_separators = { left = '', right = '' },
					section_separators = { left = '', right = '' },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = false,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					}
				},
				sections = {
					lualine_a = { 'mode' },
					lualine_b = { 'branch', 'diff', 'diagnostics' },
					lualine_c = { 'filename' },
					lualine_x = { 'encoding', 'fileformat', 'filetype' },
					lualine_y = { 'progress' },
					lualine_z = { 'location' }
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { 'filename' },
					lualine_x = { 'location' },
					lualine_y = {},
					lualine_z = {}
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {}
			})
		end
	},
	-- LSP-ZERO
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x'
	},
	{
		'neovim/nvim-lspconfig',

		init_options = {
			userLanguages = {
				eelixir = "html-eex",
				eruby = "erb",
				rust = "html",
			},
		}
	},
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
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		--   -- refer to `:h file-pattern` for more examples
		--   "BufReadPre path/to/my-vault/*.md",
		--   "BufNewFile path/to/my-vault/*.md",
		-- },
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",

			-- see below for full list of optional dependencies 👇
		},
		opts = {
			workspaces = {
				{
					name = "cp",
					path = "~/Documents/Obsidian Vault",
				},
			},
			disable_frontmatter = true

			-- see below for full list of options 👇
		},
	}
})
