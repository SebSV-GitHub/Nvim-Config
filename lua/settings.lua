vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true -- Relative numbers
vim.opt.ignorecase = true -- Ignore case in search commands
vim.opt.smartcase = true -- Change case sensitivity when use uppercase chars
vim.opt.swapfile = false -- No swap file
vim.opt.tabstop = 2 -- Tab takes 2 spaces
vim.opt.wrap = false -- Do not wrap overflowed lines
vim.opt.list = true -- Show invisible charaters
vim.opt.listchars = { tab = "▸ ", space = "·", extends = "→", precedes = "←", eol = "↲" } -- Invisible characteres reprensentations
vim.opt.mouse = {} -- Disable mouse usage
vim.opt.guicursor = "" -- Use block cursor
vim.opt.undofile = true -- Enable usage of undo after closing file using undofiles
vim.opt.termguicolors = true -- Use graphic terminal colors
vim.opt.scrolloff = 10 -- Space under and above the cursor, avoid cursor reaching the last visible line

vim.g.mapleader = " " -- <leader> key

vim.cmd("language en_US") -- Use English language
