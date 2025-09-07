return {
  "leoluz/nvim-dap-go",
  ft = "go",
  dependencies = "mfussenegger/nvim-dap",
  opts = {
    dap_configurations = {
      {
        -- Must be "go" or it will be ignored by the plugin
        type = "go",
        name = "Attach remote",
        mode = "remote",
        request = "attach",
      },
    },
    -- delve configurations
    delve = {
      path = "dlv",
      initialize_timeout_sec = 20,

      -- sudo apt install -y delve
      -- dlv debug -l 127.0.0.1:38697 --headless ./main.go

      port = "38697",
      args = {},
      build_flags = {},
      detached = vim.fn.has "win32" == 0,
      cwd = nil,
    },
    tests = {
      verbose = false,
    },
  },
  config = function(_, opts) require("dap-go").setup(opts) end,
}

