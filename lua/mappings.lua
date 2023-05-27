local nnoremap = function(keys, func, desc)
	if (desc == nil) then
		desc = ""
	end
	vim.keymap.set("n", keys, func, { noremap = true, silent = true, desc = desc })
end

-- Custom
nnoremap("<leader>ww", ":w<CR>", "Write buffer")
nnoremap("<leader>q", ":q<CR>", "Quit buffer")
nnoremap("<leader>Q", ":q!<CR>", "Force quit buffer")
nnoremap("<leader>%", ":source %<CR>", "Source file")

--	Buffer movement
nnoremap("<leader>l", ":bnext<CR>", "Next buffer")
nnoremap("<leader>h", ":bprevious<CR>", "Previous buffer")
nnoremap("<leader>bc", ":bdelete<CR>", "Delete buffer")
nnoremap("<leader>bC", ":bufdo bwipeout <CR>", "Clear buffers")

-- Plugins
-- LSP
nnoremap("<leader>e", vim.diagnostic.open_float, "Open error in foat window")
nnoremap("[d", vim.diagnostic.goto_prev, "Next error")
nnoremap("]d", vim.diagnostic.goto_next, "Previous error")
nnoremap("<leader>dl", vim.diagnostic.setloclist, "Open diagnostic list")

-- nvim-tree
nnoremap("<leader>ex", ":NvimTreeOpen<CR>", "Open file explorer")

-- Telescope
local builtin = require("telescope.builtin")
nnoremap("<leader>sf", builtin.find_files, "Search files")
nnoremap("<leader>sg", builtin.live_grep, "Search grep")
nnoremap("<leader>sb", builtin.buffers, "Search buffers")
nnoremap("<leader>sh", builtin.help_tags, "Search in tags")
