return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"akinsho/bufferline.nvim",
			version = "*",
			dependencies = "nvim-tree/nvim-web-devicons",
			opts = {
				options = {
					right_mouse_command = false,
					left_mouse_command = false,
					diagnostics = "nvim_lsp",
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							text_align = "center",
							separator = true,
						},
					},
					show_buffer_close_icons = false,
					show_close_icon = false,
					separator_style = "slant",
				},
			},
		},
	},
	opts = {
		extensions = { "fzf", "lazy", "mason", "nvim-tree" },
	},
}
