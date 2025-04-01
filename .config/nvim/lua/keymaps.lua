local map = vim.keymap.set
local default_opts = { noremap = true, silent = true }


-- Remap space as leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "


-- system clipboard S = shift
map('v', 'S-Y', '"+y', { desc = "System clipboard copy" })
map('n', 'S-P', '"+p', { desc = "System clipboard paste" })
-- fast jj = esc
map('i', 'jj', '<Esc>', { desc = "jj = esc", noremap = true })
-- USE hjkl instead
map('', '<up>', ':echoe "Use k"<CR>', { noremap = true, silent = false, desc = "up!=k" })
map('', '<down>', ':echoe "Use j"<CR>', { noremap = true, silent = false, desc = "down!=j" })
map('', '<left>', ':echoe "Use h"<CR>', { noremap = true, silent = false, desc = "left!=h" })
map('', '<right>', ':echoe "Use l"<CR>', { noremap = true, silent = false, desc = "right!=l" })
-- F-buttons
---@diagnostic disable-next-line: deprecated
map('n', '<F1>', ':nohl<CR>', { unpack(default_opts), desc = "remove highlighting" })
-- Comment
-- I don't know why, I don't want to know why, I shouldn't have to wonder why
map(
	"n",
	"<leader>/",
	"<Plug>(comment_toggle_linewise_current)",
	{ desc = "Comment line" }
)
map(
	"v",
	"<leader>/",
	"<Plug>(comment_toggle_linewise_visual)",
	{ desc = "Toggle comment line" }
)
-- Packer
map("n", "<leader>ps", "<cmd>PackerSync<cr>", { desc = "Packer sync" })
-- Telescope
map("n", "<leader>gc", function()
	require("telescope.builtin").git_commits()
end, { desc = "Telescope git commits" })

map("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end, { desc = "Telescope search files" })

map("n", "<leader>sk", function()
	require("telescope.builtin").keymaps()
end, { desc = "Telescope search keymaps" })

map("n", "<leader>lg", function()
	require("telescope.builtin").live_grep()
end, { desc = "Telescope live grep" })
-- Bufferline
map("n", "n]", function()
	require('cokeline.mappings').by_step("focus", 1)
end, { desc = "Previous buffer tab", silent = true })

map("n", "n[", function()
	require('cokeline.mappings').by_step("focus", -1)
end, { desc = "Next buffer tab", silent = true })


map("n", "}", function()
	require('cokeline.mappings').by_step("switch", -1)
end, { desc = "Move buffer tab right" })

map("n", "{", function()
	require('cokeline.mappings').by_step("switch", 1)
end, { desc = "Move buffer tab left" })
-- Ranger + NeoVim = <3
map("n", "<leader>e", "<cmd>RnvimrToggle<CR>", { desc = "Toggle Ranger" })
-- Zen mode
map("n", "<F12>", [[<Cmd>ZenMode<CR>]], { desc = "Zen Mode" })
-- Trouble
map("n", "<leader>xx", "<cmd>Trouble<cr>",
	{ silent = true, noremap = true }
)
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>",
	{ silent = true, noremap = true }
)
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>",
	{ silent = true, noremap = true }
)
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
	{ silent = true, noremap = true }
)
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
	{ silent = true, noremap = true }
)
