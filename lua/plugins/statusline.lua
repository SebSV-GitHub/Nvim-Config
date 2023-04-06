local navic = require("nvim-navic")

navic.setup({
	highlight = true,
})

require("lualine").setup({
	winbar = {
		lualine_c = {
			{
				function()
					return navic.get_location()
				end,
				cond = function()
					return navic.is_available()
				end,
			},
		},
	},
	tabline = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { require("tabline").tabline_buffers },
		lualine_x = { require("tabline").tabline_tabs },
		lualine_y = {},
		lualine_z = {},
	},
})
