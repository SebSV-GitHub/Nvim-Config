-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup({
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	-- renderer = {
	-- 	icons = {
	-- 		glyphs = {
	-- 			git = {
	-- 				unstaged = "🚧",
	-- 				staged = "🎯",
	-- 				unmerged = "",
	-- 				renamed = "✏️",
	-- 				untracked = "🕵️",
	-- 				deleted = "🗑️",
	-- 				ignored = "🙈",
	-- 			},
	-- 		}
	-- 	}
	-- }
})
