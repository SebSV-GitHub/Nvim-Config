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
		"jsonls",
		"yamlls",
	},
})

local schemastore = require("schemastore")
local server_settings = {
	jsonls = {
		json = {
			schemas = schemastore.json.schemas(),
		},
	},
	yamlls = {
		yaml = {
			schemaStore = {
				enable = false,
			},
			schemas = schemastore.yaml.schemas(),
		},
	},
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			settings = server_settings[server_name],
		})
	end,
})

require("null-ls").setup()
require("mason-null-ls").setup({
	automatic_setup = true,
	handlers = {},
})
