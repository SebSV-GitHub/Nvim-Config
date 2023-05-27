require("mason").setup({
	ui = {
		icons = {
			package_installed = "✅",
			package_pending = "🚚",
			package_uninstalled = "📦",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
	},
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
		})
	end,
})

require("null-ls").setup()
require("mason-null-ls").setup({
	automatic_setup = true,
	handlers = {},
})
