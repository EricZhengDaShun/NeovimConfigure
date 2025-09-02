return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>xw",
			function()
				vim.diagnostic.setqflist({ open = false })
				require("trouble").open("quickfix")
			end,
			desc = "Workspace Diagnostics (Quickfix)",
		},
		{
			"<leader>xd",
			function()
				vim.diagnostic.setloclist({ open = false })
				require("trouble").open("loclist")
			end,
			desc = "Document Diagnostics (Loclist)",
		},
		{
			"<leader>xr",
			function()
				require("trouble").toggle("lsp_references")
			end,
			desc = "LSP References (Trouble)",
		},
	},
	opts = {},
}
