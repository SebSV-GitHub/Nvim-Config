require("lazy").setup({
	{
		"morhetz/gruvbox",
		"tomasiser/vim-code-dark",
		"xiyaowong/transparent.nvim"
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		}
	},
	{ "folke/neodev.nvim",               opts = {} },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				version = "1.*",
				build = "make install_jsregexp",
			},
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind.nvim"
		}
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"kdheepak/tabline.nvim",
			"arkav/lualine-lsp-progress"
		}
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = { "nvim-lua/plenary.nvim" }
	}
}, {
	ui = {
		icons = {
			cmd = "💻",
			config = "⚙️",
			event = "🎉",
			ft = "🏁",
			init = "🚀",
			import = "🔗",
			keys = "🔑",
			lazy = "😴",
			loaded = "✅",
			not_loaded = "🚫",
			plugin = "🧩",
			runtime = "🏭",
			source = "📄",
			start = "⏱️",
			task = "📋",
			list = {
				"●",
				"➜",
				"★",
				"‒",
			},
		},
	}
})

require("plugins.lsp")
require("plugins.completion")
require("plugins.neodev")
require("plugins.mason")
require("plugins.tree-sitter")
require("plugins.statusline")
require("plugins.file-explorer")
