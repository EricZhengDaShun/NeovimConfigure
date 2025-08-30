return {
	"leoluz/nvim-dap-go",
	config = function()
		require("dap-go").setup({
			dap_configurations = {
				{
					type = "go",
					name = "Attach remote",
					mode = "remote",
					request = "attach",
					host = "127.0.0.1",
					port = 2345,
				},
			},
		})
	end,
}
