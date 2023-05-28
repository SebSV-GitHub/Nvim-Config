local bufferline = require("bufferline")

bufferline.setup({
	options = {
		diagnostics = "nvim_lsp",
		show_buffer_close_icons = false,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = true,
			},
		},
	},
})

require("lualine").setup({
	sections = {
		lualine_c = {
			{
				"lsp_progress",
				spinner_symbols = { "🌍 ", "🌎 ", "🌏 " },
			},
		},
	},
	extensions = {
		"nvim-tree",
	},
})
