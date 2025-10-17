return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	opts = {},
	config = function(_, opts)
		require("dapui").setup(opts)
	end,
	keys = {
		{
			mode = "n",
			"<leader>ud",
			function()
				require("dapui").toggle()
			end,
			desc = "Toggle Debug UI",
		},
	},
}
