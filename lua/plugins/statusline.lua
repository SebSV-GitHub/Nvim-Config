local bufferline = require("bufferline")

local c = require("vscode.colors").get_colors()
bufferline.setup({
	options = {
		diagnostics = "nvim_lsp",
		show_buffer_close_icons = false,
		show_close_icon = false,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = true,
			},
		},
	},
	highlights = {
		background = {
			fg = c.vscLineNumber,
		},
		buffer_visible = {
			fg = c.vscLineNumber,
		},
		tab = {
			fg = c.vscLineNumber,
		},
		tab_selected = {
			fg = c.vscGray,
			bold = true,
		},
	},
})

require("lualine").setup({
	extensions = {
		"nvim-tree",
	},
})
