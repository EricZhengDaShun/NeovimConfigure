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
		-- CMake-Tools
		{ mode = { "n", "v" }, "<leader>lc", "<cmd>CMake<cr>" },
		{ mode = { "n", "v" }, "<leader>lcs", "<cmd>CMake Select<cr>" },
		{
			mode = "n",
			"<leader>lcd",
			"<cmd>:CMakeDebug<cr>",
			desc = "CMake Debug",
		},
		{
			mode = "n",
			"<leader>lcg",
			"<cmd>:CMakeGenerate<cr>",
			desc = "CMake Generate",
		},
		{
			mode = "n",
			"<leader>lcG",
			"<cmd>:CMakeGenerate!<cr>",
			desc = "CMake Clean Generate",
		},
		{
			mode = "n",
			"<leader>lcb",
			"<cmd>:CMakeBuild<cr>",
			desc = "CMake Build",
		},
		{
			mode = "n",
			"<leader>lcB",
			"<cmd>:CMakeBuild!<cr>",
			desc = "CMake Clean Build",
		},
		{
			mode = "n",
			"<leader>lca",
			function()
				local command = ":CMakeLaunchArgs "
				local args = vim.fn.input("Enter your args:")
				command = command .. args
				vim.cmd(command)
			end,
			desc = "CMake Launch Args",
		},
		{
			mode = "n",
			"<leader>lcsb",
			"<cmd>:CMakeSelectBuildType<cr>",
			desc = "Select Build Type",
		},
		{
			mode = "n",
			"<leader>lcsc",
			"<cmd>:CMakeSelectConfigurePreset<cr>",
			desc = "Select Configure Preset",
		},
		{
			mode = "n",
			"<leader>lcsp",
			"<cmd>:CMakeSelectBuildPreset<cr>",
			desc = "Select Build Preset",
		},
	},
}
