return {
	"Civitasv/cmake-tools.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		cmake_build_directory = function()
			local osys = require("cmake-tools.osys")
			if osys.iswin32 then
				return "build\\${variant:buildType}"
			end
			return "build/${variant:buildType}"
		end,
		cmake_compile_commands_options = {
			action = "none",
		},
		cmake_dap_configuration = {
			name = "cpp",
			type = "codelldb",
			request = "launch",
			stopOnEntry = false,
			runInTerminal = true,
			console = "integratedTerminal",
		},
	},
	config = function(_, opts)
		require("cmake-tools").setup(opts)
	end,
}
