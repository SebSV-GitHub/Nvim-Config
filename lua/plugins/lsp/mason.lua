return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"b0o/schemastore.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()

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

			local capabilities = vim.tbl_deep_extend(
				"force",
				vim.lsp.protocol.make_client_capabilities(),
				require("cmp_nvim_lsp").default_capabilities()
			)

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						on_attach = function(client)
							client.server_capabilities.semanticTokensProvider = nil
						end,
						settings = server_settings[server_name],
					})
				end,
			})
		end,
	},
}
