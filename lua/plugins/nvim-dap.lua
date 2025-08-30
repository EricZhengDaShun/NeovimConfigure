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
            options = {
                source_filetype = "python",
            },
        }

        dap.configurations.python = {
            {
                type = "python",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                pythonPath = get_python_path,
                console = "integratedTerminal",
            },
        }

    end,
}
