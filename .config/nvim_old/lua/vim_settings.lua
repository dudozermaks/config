local cmd = vim.cmd
local g = vim.g
local exec = vim.api.nvim_exec
local opt = vim.opt
-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]
-- remember where nvim edit file last time :wq
cmd [[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]
-- highlight copied text
exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup end
]], false)
-- main
opt.undofile = true                         -- undo
opt.number = true
opt.mouse = "a"                             -- Enable mouse support
opt.signcolumn = "number"                   -- Always show the sign column
opt.completeopt = { "menuone", "noselect" } -- Options for insert mode completion
opt.backup = false                          -- Disable making a backup file
opt.termguicolors = true                    -- Enable 24-bit RGB color in the TUI
opt.scrolloff = 8                           -- Number of lines to keep above and below the cursor
opt.sidescrolloff = 8                       -- Number of columns to keep at the sides of the cursor
opt.history = 1000                          -- Number of commands to remember in a history table

-- opacity = none
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

--lsp update in insert mode
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--     update_in_insert = true,
--   }
-- )
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = false,
	float = {
		border = 'rounded',
		source = true,
	},
})


g.do_filetype_lua = 1         -- use filetype.lua
g.did_load_filetypes = 0      -- don't use filetype.vim
g.highlighturl_enabled = true -- highlight URLs by default
-- setting font for gui neovim clients
opt.guifont = { "ComicCodeLigatures", "h12" }
-- ranger
-- set ranger as default file explorer
g.rnvimr_enable_ex = 1

-- opt.runtimepath:prepend("~/shit/work/nvim_plugins/pet.nvim")

-- opt.foldmethod = "indent"
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 999
opt.foldclose = "all"
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
	pattern = { "*.*" },
	desc = "save view (folds), when closing file",
	command = "mkview",
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*.*" },
	desc = "load view (folds), when opening file",
	command = "silent! loadview"
})

vim.cmd([[
  filetype indent plugin on
  syntax enable
]])
-- vim.opt.expandtab = true      -- use spaces instead of tabs
vim.opt.shiftwidth = 2     -- shift 2 spaces when tab
vim.opt.tabstop = 2        -- 1 tab == 2 spaces
vim.opt.autoindent = true
vim.opt.smartindent = true -- autoindent new lines


vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
vim.opt_local.conceallevel = 2
