local on_attach = function(_, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

-- NEODEV-CONFIG
require("neodev").setup({})

-- MASON-CONFIG
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local mason_null_ls = require("mason-null-ls")
local mason_lsp = require("mason-lspconfig")
mason_lsp.setup()
require("null-ls").setup({})
mason_null_ls.setup({
	automatic_setup = true,
})
mason_null_ls.setup_handlers({})

-- LSP-CONFIG
local lsp = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

mason_lsp.setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		lsp[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
	-- Next, you can provide a dedicated handler for specific servers.
	-- For example, a handler override for the `rust_analyzer`:
	-- ["rust_analyzer"] = function ()
	--     require("rust-tools").setup {}
	-- end
	["lua_ls"] = function()
		lsp.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})
	end,
	["jsonls"] = function()
		lsp.jsonls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				json = {
					schemas = {
						{
							fileMatch = { "package.json" },
							url = "https://json.schemastore.org/package.json",
						},
						{
							fileMatch = { "tsconfig.json" },
							url = "https://json.schemastore.org/tsconfig.json",
						},
					},
				},
			},
		})
	end,
	["yamlls"] = function()
		lsp.yamlls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				yaml = {
					customTags = {
						"!And scalar",
						"!If scalar",
						"!Not",
						"!Equals scalar",
						"!Or scalar",
						"!FindInMap scalar",
						"!Base64",
						"!Cidr",
						"!Ref",
						"!Sub",
						"!GetAtt sequence",
						"!GetAZs",
						"!ImportValue sequence",
						"!Select sequence",
						"!Split sequence",
						"!Join sequence",
					},
					schemas = {
						["https://raw.githubusercontent.com/aws/serverless-application-model/main/samtranslator/schema/schema.json"] = "/template.yaml",
						["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "/gitlab-ci.yml",
					},
				},
			},
		})
	end,
})

-- CMP-CONFIG
-- Supertab function
local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip") -- Snipet engine
local lspkind = require("lspkind") -- CMP format engine
local cmp = require("cmp")
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			menu = {
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[Latex]",
			},
		}),
	},
	experimental = {
		ghost_text = true,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs( -4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete({}),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
				-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
				-- they way you will only jump inside the snippet region
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable( -1) then
				luasnip.jump( -1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = "buffer" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- For luasnip users.
	}, {
		{ name = "buffer" },
	}),
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- FIDGET-CONFIG
require("fidget").setup({})

require("lsp_signature").setup({
	bind = true, -- This is mandatory, otherwise border config won't get registered.
	handler_opts = {
		border = "rounded",
	},
	hint_prefix = "🧐 "
})
