local nnoremap = function(keys, func, desc)
	if desc == nil then
		desc = ""
	end
	vim.keymap.set("n", keys, func, { noremap = true, desc = desc })
end

-- Custom
nnoremap("<leader>w", ":w<CR>", "Write buffer")
nnoremap("<leader>q", ":q<CR>", "Quit buffer")
nnoremap("<leader>Q", ":q!<CR>", "Force quit buffer")
nnoremap("<leader><leader>", ":nohlsearch<CR>", "Clean search highlight")
nnoremap("<leader>y", '"*y', "Copy to clipboard")
-- Buffer movement
nnoremap("<leader>h", ":bprevious<CR>", "Previous buffer")
nnoremap("<leader>l", ":bnext<CR>", "Next buffer")
nnoremap("<leader>bd", ":bdelete<CR>", "Close buffer")
-- Window movement
nnoremap("<C-h>", "<C-w><C-h>", "Move to left window")
nnoremap("<C-j>", "<C-w><C-j>", "Move to bottom window")
nnoremap("<C-k>", "<C-w><C-k>", "Move to upper window")
nnoremap("<C-l>", "<C-w><C-l>", "Move to right window")

-- lspconfig
nnoremap("n", "<leader>e", vim.diagnostic.open_float)
nnoremap("n", "[d", vim.diagnostic.goto_prev)
nnoremap("n", "]d", vim.diagnostic.goto_next)
nnoremap("n", "<leader>d", vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	end,
})

--  Nvim tree
nnoremap("<leader>ex", ":NvimTreeToggle<CR>", "Open file explorer")

-- Telescope
local telescope_builtin = require("telescope.builtin")
nnoremap("<leader>sf", telescope_builtin.find_files, "Find files")
nnoremap("<leader>sg", telescope_builtin.live_grep, "Find text")
nnoremap("<leader>sb", telescope_builtin.buffers, "Find buffer")
nnoremap("<leader>sh", telescope_builtin.help_tags, "Find tags")

-- LSP signature
nnoremap("<leader>k", function()
	vim.lsp.buf.signature_help()
end, "Toggle signature")

-- Conform
nnoremap("<leader>f", function()
	require("conform").format()
end, "Format")
