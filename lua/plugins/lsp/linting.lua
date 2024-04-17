return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			lua = {
				"selene",
			},
			typescript = {
				"xo",
			},
			typescriptreact = {
				"xo",
			},
		}

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
