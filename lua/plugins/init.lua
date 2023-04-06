require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"jose-elias-alvarez/null-ls.nvim",
			"jay-babu/mason-null-ls.nvim",
			"j-hui/fidget.nvim",
		},
	})

	use("b0o/schemastore.nvim") -- Adds schema store to jsonls

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind.nvim",
			"L3MON4D3/LuaSnip", -- READ DOCS
			"saadparwaiz1/cmp_luasnip",
			"ray-x/lsp_signature.nvim",
		},
	})

	use("folke/neodev.nvim") -- READ DOCS

	use("LunarVim/darkplus.nvim")
	use("navarasu/onedark.nvim")
	use("xiyaowong/transparent.nvim")

	use({
		"nvim-lualine/lualine.nvim",
	})
	use({
		"kdheepak/tabline.nvim",
		requires = { "hoob3rt/lualine.nvim", "kyazdani42/nvim-web-devicons" },
	})
	use({
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use("lukas-reineke/indent-blankline.nvim") -- READ DOCS

	use("numToStr/Comment.nvim")              -- READ DOCS

	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" } })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})
end)

-- require("plugins.icons")
require("plugins.lsp")
require("plugins.tabline")
require("plugins.statusline")
require("plugins.treesitter")
require("plugins.indent")
require("plugins.telescope")
require("plugins.file_explorer")
