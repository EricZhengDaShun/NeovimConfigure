-- if true then return {} end

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim", 
      "nvim-tree/nvim-web-devicons", 
      "MunifTanjim/nui.nvim"
    },
    cmd = "Neotree",
    keys = {
      {
        "<leader>e",
        function()
          vim.cmd.Neotree("toggle")
        end,
        desc = "Explorer NeoTree"
      }
    },
    opts = {
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        filesystem = {
            hijack_netrw_behavior = "open_default",
        },
        window = {
            width = 30
        },
    },
}
