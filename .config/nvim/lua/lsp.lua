local lsp = require('lsp-zero').preset({})
local dap = require('dap')

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
lsp.setup_servers({ "clangd", "lua_ls", "emmet_ls", "pylsp", "marksman", "dartls", "bashls", "gopls", "wgsl_analyzer"})
-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.nvim_lua_ls()
lsp.setup()

require('lspconfig').rust_analyzer.setup {
	settings = {
		['rust-analyzer'] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true
			},
		}
	}
}
require("rust-tools").setup()

require('lspconfig').ltex.setup {
	filetypes = { "markdown", "text" },
	on_attach = function(client, bufnr)
		require("ltex_extra").setup {
			path = ".ltex"
		}
	end,
}

require('lspconfig').gdscript.setup {
	filetypes = { "gd", "gdscript", "gdscript3" },
	on_attach = function(client, bufnr)
		vim.api.nvim_command('echo serverstart("./godothost")')
		vim.keymap.set('n', "<leader>ls", function() require 'dap'.continue() end, { desc = "Launch main scene" })
	end,
	cmd = vim.lsp.rpc.connect('127.0.0.1', 6005),
	flags = { debounce_text_changes = 500 }
}


dap.adapters.godot = {
	type = "server",
	host = '127.0.0.1',
	port = 6006,
}

dap.configurations.gdscript = {
	{
		type = "godot",
		request = "launch",
		name = "Launch scene",
		project = "${workspaceFolder}",
		launch_scene = true,
	}
}

-- Configure wgsl filetype
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.wgsl",
  callback = function()
    vim.bo.filetype = "wgsl"
  end,
})
--       local MY_FQBN = "arduino:avr:nano"
--       require("lspconfig").arduino_language_server.setup{
--         cmd = {
--           "/home/maks/go/bin/arduino-language-server",
--           "-cli-config", "/home/maks/.arduino15/arduino-cli.yaml",
--           "-fqbn",
--           MY_FQBN
--         }

-- delete with luasnip
local cmp = require('cmp')

local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			require 'luasnip'.lsp_expand(args.body)
		end
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},

	mapping = {
		-- `Ctrl - Enter` key to confirm completion
		['<C-CR>'] = cmp.mapping.confirm({ select = true }),
		-- Jump forward and backwards with luasnip
		["<Tab>"] = cmp.mapping(function(fallback)
			-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
			-- they way you will only jump inside the snippet region
			if luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
				-- elseif has_words_before() then
				--   cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<C-Tab>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
		['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
	},
	completion = {
		completeopt = 'menu,menuone,noinsert'
	}
})

vim.loader.enable() -- for performance (cache)

