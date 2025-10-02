return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	opts = {
		handlers = {
			function(config)
				require("mason-nvim-dap").default_setup(config)
			end,
		},
	},
	config = function(_, opts)
		require("mason-nvim-dap").setup(opts)
	end,
}
