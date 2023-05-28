require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"vim",
		"vimdoc",
	},
	auto_install = false,
	highlight = {
		enable = true,
	},
})
