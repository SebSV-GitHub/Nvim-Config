require("lazy").setup({
	{
		"morhetz/gruvbox",
		"Mofiqul/vscode.nvim",
		"navarasu/onedark.nvim",
		"xiyaowong/transparent.nvim",
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"b0o/schemastore.nvim",
		},
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			{
				"jay-babu/mason-null-ls.nvim",
				event = { "BufReadPre", "BufNewFile" },
			},
		},
	},
	{ "folke/neodev.nvim", opts = {} },
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
		},
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			{
				"akinsho/bufferline.nvim",
				version = "*",
				dependencies = "nvim-tree/nvim-web-devicons",
			},
			{
				"j-hui/fidget.nvim",
				tag = "legacy",
				event = "LspAttach",
			},
		},
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
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
	},
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
	},
})

require("plugins.icons")
require("plugins.neodev")
require("plugins.lsp")
require("plugins.completion")
require("plugins.mason")
require("plugins.tree-sitter")
require("plugins.statusline")
require("plugins.file-explorer")
require("plugins.fidget")
require("plugins.telescope")
require("plugins.git")
