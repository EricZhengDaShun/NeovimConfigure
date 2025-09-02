return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			cpp = { "clang-format" },
			c = { "clang-format" },
			python = { "black" },
			cmake = { "cmake_format" },
			yaml = { "yamlfmt" },
			json = { "jq" },
			markdown = { "prettier" },
			vim = { "vimlint" },
			vimdoc = { "vimlint" },
			sql = { "sql-formatter" },
			git_config = { "prettier" },
			git_rebase = { "prettier" },
			gitattributes = { "prettier" },
			gitcommit = { "prettier" },
			gitignore = { "prettier" },
		},
		format_on_save = false,
	},
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = { "n", "v" },
			desc = "[l]sp [F]ormat",
		},
	},
}
