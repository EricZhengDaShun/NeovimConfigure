return {
	"Civitasv/cmake-tools.nvim",
	lazy = true,
	init = function()
		local loaded = false
		local function check()
			local cwd = vim.uv.cwd()
			if vim.fn.filereadable(cwd .. "/CMakeLists.txt") == 1 then
				require("lazy").load({ plugins = { "cmake-tools.nvim" } })
				loaded = true
			end
		end
		check()
		vim.api.nvim_create_autocmd("DirChanged", {
			callback = function()
				if not loaded then
					check()
				end
			end,
		})
	end,
	opts = {
		cmake_compile_commands_options = {
			action = "lsp",
		},
	},
	keys = {
		{ "<leader>lcsp", "<cmd>CMakeSelectConfigurePreset<cr>", desc = "CMake Select Configure Preset" },
		{ "<leader>lcsb", "<cmd>CMakeSelectBuildType<cr>", desc = "CMake Select Build Type" },
		{ "<leader>lcg", "<cmd>CMakeGenerate<cr>", desc = "CMake Generate" },
		{ "<leader>lcb", "<cmd>CMakeBuild<cr>", desc = "CMake Build" },
		{ "<leader>lcr", "<cmd>CMakeRun<cr>", desc = "CMake Run" },
		{ "<leader>lcc", "<cmd>CMakeClean<cr>", desc = "CMake Clean" },
		{ "<leader>lct", "<cmd>CMakeSelectBuildTarget<cr>", desc = "CMake Select Target" },
		{ "<leader>lcd", "<cmd>CMakeDebug<cr>", desc = "CMake Debug" },
	},
}
