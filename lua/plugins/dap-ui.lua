return {
    "rcarriga/nvim-dap-ui",
    opts = function(_, opts)
        opts = opts or {}
        opts.layouts = {
            {
                elements = {
                    { id = "scopes",      size = 0.40 },
                    { id = "breakpoints", size = 0.20 },
                    { id = "stacks",      size = 0.20 },
                    { id = "watches",     size = 0.20 },
                },
                size = 60,
                position = "left",
            },
            {
                elements = {
                    { id = "repl",    size = 0.50 },
                    { id = "console", size = 0.50 },
                },
                size = 15,
                position = "bottom",
            },
        }
        opts.floating = vim.tbl_deep_extend("force", opts.floating or {}, {
            max_height = 40,
            max_width = 120,
            border = "rounded",
        })
        return opts
    end,
}
