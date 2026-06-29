local map = vim.keymap.set

map('n', 'K', vim.lsp.buf.hover, { desc = "Show line error" })
map('i', 'jj', '<Esc>', { silent = true, desc = "jj == esc" })

map('n', '{', vim.cmd.BufferPrevious, { silent = true, desc = "Go to previous file" })
map('n', '}', vim.cmd.BufferNext, { silent = true, desc = "Go to next file" })

map('v', 'S-Y', '"+y', { desc = "System clipboard copy" })
map('n', 'S-P', '"+p', { desc = "System clipboard paste" })

map('n', '<F1>', vim.cmd.nohl, { desc = "Remove highlight" })

map('v', '<leader>/', 'gc', { remap=true, desc = "Comment line (s) in visual mode" })
map('n', '<leader>/', 'gcc', { remap=true, desc = "Comment line in normal mode" })

map("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end, { desc = "Telescope search files" })

map("n", "<leader>sk", function()
	require("telescope.builtin").keymaps()
end, { desc = "Telescope search keymaps" })

map("n", "<leader>lg", function()
	require("telescope.builtin").live_grep()
end, { desc = "Telescope live grep" })

map('n', '<leader>f', function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer with LSP" })

-- BLINK KEYBINDINGS IN THE OTHER FILE
