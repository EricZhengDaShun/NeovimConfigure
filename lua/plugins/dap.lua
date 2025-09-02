return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = {
          "nvim-neotest/nvim-nio",
          "MunifTanjim/nui.nvim",
        },
        config = function()
          local dapui = require("dapui")
          dapui.setup({
            layouts = {
              {
                elements = {
                  { id = "scopes", size = 0.25 },
                  { id = "breakpoints", size = 0.25 },
                  { id = "stacks", size = 0.25 },
                  { id = "watches", size = 0.25 },
                },
                size = 40,
                position = "left",
              },
              {
                elements = { { id = "repl", size = 0.5 }, { id = "console", size = 0.5 } },
                size = 10,
                position = "bottom",
              },
            },
          })

          local dap = require("dap")
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
          end
        end,
      },
    },
    keys = {
      {
        "<leader>dt",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<leader>dO",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>dk",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.open()
        end,
        desc = "Open REPL",
      },
      {
        "<leader>dU",
        function()
          require("dapui").toggle()
        end,
        desc = "Toggle DAP UI",
      },
    },
    config = function()
      local dap = require("dap")
      local codelldb_path = vim.fn.expand("$MASON/bin/codelldb")
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = codelldb_path,
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
  },
}
