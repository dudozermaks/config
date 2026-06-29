vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
-- wrap long strings
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- File safely
opt.swapfile = false
opt.backup = false
opt.undofile = true
