return {
	"neovim/nvim-lspconfig",
	dependencies = {
		require("plugins.lsp.development"),
		require("plugins.lsp.mason"),
		require("plugins.lsp.formatting"),
		require("plugins.lsp.linting"),
	},
}
