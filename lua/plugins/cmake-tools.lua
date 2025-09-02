return {
	"Civitasv/cmake-tools.nvim",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	ft = { "cmake", "cpp", "c" },
	opts = {
		cmake_soft_link_compile_commands = false,
		cmake_compile_commands_options = {
			action = "lsp",
		},
		cmake_command = "cmake",
		cmake_build_directory = "build",
		cmake_build_type = "Debug",
		cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
		cmake_regenerate_on_save = true,
		-- cmake_dap_configuration = { "cppdbg" },
		cmake_dap_configuration = { name = "Launch file", type = "codelldb", request = "launch" },
		cmake_executor = { name = "quickfix" },
	},
	keys = {
		{ "<leader>cg", "<cmd>CMakeGenerate<CR>", desc = "CMake Generate" },
		{ "<leader>cb", "<cmd>CMakeBuild<CR>", desc = "CMake Build" },
		{ "<leader>cq", "<cmd>CMakeQuickBuild<CR>", desc = "CMake Quick Build" },
		{ "<leader>cr", "<cmd>CMakeRun<CR>", desc = "CMake Run" },
		{ "<leader>cd", "<cmd>CMakeDebug<CR>", desc = "CMake Debug" },
		{ "<leader>cp", "<cmd>CMakeSelectConfigurePreset<CR>", desc = "CMake Select Configure Preset" },
		{ "<leader>cP", "<cmd>CMakeSelectBuildPreset<CR>", desc = "CMake Select Build Preset" },
	},
}
