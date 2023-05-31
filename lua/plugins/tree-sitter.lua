require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"vim",
		"vimdoc",
		"json",
		"yaml",
	},
	auto_install = false,
	highlight = {
		enable = true,
	},
})
