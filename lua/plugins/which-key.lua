return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {},
	init = function()
		-- always show
		vim.opt.timeout = true
		vim.opt.timeoutlen = 0
	end,
	config = function(_, opts)
		require("which-key").setup(opts)
	end,
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
		{ mode = { "n", "v" }, "<leader>l", "<cmd>LSP<cr>" },
		{ mode = { "n", "v" }, "<leader>u", "<cmd>UI<cr>" },
		{ mode = { "n", "v" }, "<leader>d", "<cmd>Debug<cr>" },
	},
}
