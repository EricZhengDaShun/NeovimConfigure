return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")

		dap.configurations.rust = {
			{
				name = "Launch executable",
				type = "codelldb",
				request = "launch",
				preLaunchTask = function()
					vim.notify("Running cargo build...", vim.log.levels.INFO)
					local output = vim.fn.system("cargo build")
					if vim.v.shell_error ~= 0 then
						vim.notify("Build failed:\n" .. output, vim.log.levels.ERROR)
						return false
					else
						vim.notify("Build successful!", vim.log.levels.INFO)
					end
				end,
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = function()
					local args_str = vim.fn.input("Arguments: ")
					if args_str == "" then
						return {} -- 如果使用者沒輸入，就回傳一個空 table
					end

					local args_tbl = {}
					-- 用空格分割字串
					for arg in string.gmatch(args_str, "[^%s]+") do
						table.insert(args_tbl, arg)
					end
					return args_tbl
				end,
			},
			{
				name = "Debug unit test",
				type = "codelldb",
				request = "launch",
				program = function()
					local test_name = vim.fn.input("Name of test to debug: ")
					if test_name == "" then
						return
					end

					vim.cmd("!cargo test --no-run --test " .. test_name)
					local executable_path = vim.fn.glob(
						vim.fn.getcwd() .. "/target/debug/deps/" .. test_name .. vim.fn.has("win32") and "*.exe" or ""
					)
					return vim.fn.trim(executable_path)
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = function()
					local test_fn_name = vim.fn.input("Name of test function to run: ")
					if test_fn_name == "" then
						return {}
					end
					return { test_fn_name }
				end,
			},
		}
	end,
}
