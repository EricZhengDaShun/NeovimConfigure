return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")

		-- python
		local get_python_path = function()
			local cwd = vim.fn.getcwd()
			local separator = vim.fn.has("win32") == 1 and "\\" or "/"

			local venv_path = cwd .. separator .. ".venv" .. separator
			if vim.fn.has("win32") == 1 then
				if vim.fn.executable(venv_path .. "Scripts" .. separator .. "python.exe") == 1 then
					return venv_path .. "Scripts" .. separator .. "python.exe"
				end
			else
				if vim.fn.executable(venv_path .. "bin" .. separator .. "python") == 1 then
					return venv_path .. "bin" .. separator .. "python"
				end
			end
		end

		dap.adapters.python = {
			type = "executable",
			command = get_python_path(),
			args = { "-m", "debugpy.adapter" },
		}

		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				pythonPath = get_python_path,
				stopOnEntry = true,
			},
		}

		-- c#
		local netcoredbg_path
		if vim.fn.has("win32") == 1 then
			netcoredbg_path = vim.fn.expand("$MASON/packages/netcoredbg/netcoredbg/netcoredbg.exe")
		else
			netcoredbg_path = vim.fn.expand("$MASON/packages/netcoredbg/netcoredbg/netcoredbg")
		end
		dap.adapters.coreclr = {
			type = "executable",
			command = netcoredbg_path,
			args = { "--interpreter=vscode" },
		}

		dap.configurations.cs = {
			{
				name = "Launch .NET Core project",
				type = "coreclr",
				request = "launch",
				program = function()
					return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}
	end,
}
