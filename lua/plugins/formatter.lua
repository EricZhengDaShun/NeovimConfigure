return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lau = { "stylua" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			python = { "isort", "black" },
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)
	end,
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 3000,
				})
			end,
			mode = { "n", "v" },
			desc = "Format buffer",
		},
	},
}
