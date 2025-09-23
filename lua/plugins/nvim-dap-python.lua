return {
    "mfussenegger/nvim-dap",
    dependencies = { "rcarriga/nvim-dap-ui" },
    config = function()
        local dap = require("dap")

        local function get_python_path()
            local cwd = vim.fn.getcwd()
            local venv_path = vim.fn.findfile(".venv/Scripts/python.exe", cwd .. ";")
            if venv_path ~= "" then
                return venv_path
            end
            venv_path = vim.fn.findfile("venv/Scripts/python.exe", cwd .. ";")
            if venv_path ~= "" then
                return venv_path
            end
            local venv = vim.fn.findfile(".venv/bin/python", cwd .. ";")
            if venv ~= "" then
                return venv
            end
            return "python"
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
                program = "${file}", -- Debug the currently open file
                pythonPath = get_python_path,
                console = "integratedTerminal",
            },
            {
                type = "python",
                request = "launch",
                name = "Launch file with args",
                program = "${file}",
                pythonPath = get_python_path,
                console = "integratedTerminal",
                args = function()
                    local args_str = vim.fn.input("Arguments: ")
                    local args_tbl = {}
                    for arg in string.gmatch(args_str, "[^%s]+") do
                        table.insert(args_tbl, arg)
                    end
                    return args_tbl
                end,
            },
            {
                type = "python",
                request = "launch",
                name = "Launch module",
                module = function()
                    return vim.fn.input("Python module to launch: ")
                end,
                pythonPath = get_python_path,
                console = "integratedTerminal",
            },
        }
    end,
}
