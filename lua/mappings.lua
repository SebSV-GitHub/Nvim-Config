-- Custom
vim.keymap.set("n", "<leader>ex", ":Neotree<CR>") -- Open file explorer
vim.keymap.set("n", "<leader>ww", ":w<CR>") -- Write the changes
vim.keymap.set("n", "<leader>q", ":q<CR>") -- Quit
vim.keymap.set("n", "<leader>bn", ":bn<CR>") -- Next buffer
vim.keymap.set("n", "<leader>bp", ":bp<CR>") -- Previous buffer
vim.keymap.set("n", "<leader>bcc", ":bdelete<CR>") -- Close buffer
vim.keymap.set("n", "<leader>bca", ":bufdo bwipeout<CR>") -- Close buffer

-- lsp
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>dl", vim.diagnostic.setloclist, opts)

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sf", builtin.find_files, {})
vim.keymap.set("n", "<leader>sg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>sb", builtin.buffers, {})
vim.keymap.set("n", "<leader>sh", builtin.help_tags, {})

-- Mason keymaps
--toggle_package_expand = "<CR>",
--install_package = "i",
--update_package = "u",
--check_package_version = "c",
--update_all_packages = "U",
--check_outdated_packages = "C",
--uninstall_package = "X",
--cancel_installation = "<C-c>",
--apply_language_filter = "<C-f>",
