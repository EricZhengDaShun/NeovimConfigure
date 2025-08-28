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

		
		----------------------------------------------------------------
		-- C / C++ / Rust (codelldb via mason)
		----------------------------------------------------------------
    local mason_registry = require("mason-registry")
		mason_registry:on("package:load", function(pkg)
			if pkg:name() == "codelldb" then
				local extension_path = pkg:get_install_path()
				-- local codelldb_path = extension_path .. "/extension/adapter/codelldb"

				local liblldb_path = extension_path .. "/extension/lldb/lib/liblldb"
				if vim.fn.has("mac") == 1 then
					liblldb_path = liblldb_path .. ".dylib"
				elseif vim.fn.has("unix") == 1 then
					liblldb_path = liblldb_path .. ".so"
				elseif vim.fn.has("win32") == 1 then
					liblldb_path = liblldb_path .. ".dll"
				end

				dap.adapters.codelldb = {
					type = "server",
					port = "${port}",
					executable = {
						command = liblldb_path,
						args = { "--port", "${port}" },
					},
				}

				dap.configurations.cpp = {
					{
						name = "Launch file",
						type = "codelldb",
						request = "launch",
						program = function()
							return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
						end,
						cwd = "${workspaceFolder}",
						stopOnEntry = false,
					},
				}

				dap.configurations.c = dap.configurations.cpp
				dap.configurations.rust = dap.configurations.cpp
			end
		end)
	end,
}
