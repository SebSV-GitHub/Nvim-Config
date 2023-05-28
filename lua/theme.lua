require("transparent").setup({
	groups = { -- table: default groups
		"Normal",
		"NormalNC",
		"Comment",
		"Constant",
		"Special",
		"Identifier",
		"Statement",
		"PreProc",
		"Type",
		"Underlined",
		"Todo",
		"String",
		"Function",
		"Conditional",
		"Repeat",
		"Operator",
		"Structure",
		"LineNr",
		"NonText",
		"SignColumn",
		"CursorLineNr",
		"EndOfBuffer",
	},
	extra_groups = {}, -- table: additional groups that should be cleared
	exclude_groups = {}, -- table: groups you don't want to clear
})

require("onedark").setup({
	style = "dark",
	transparent = true,
	lualine = {
		transparent = true,
	},
})
require("onedark").load()

vim.cmd.colorscheme("onedark")
