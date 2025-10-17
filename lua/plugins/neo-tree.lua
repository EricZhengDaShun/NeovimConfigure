return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
            default_component_configs = {
                indent = { padding = 1 },
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                },
                git_status = {
                    symbols = {
                        added = "",
                        modified = "",
                        deleted = "",
                        renamed = "",
                        untracked = "★",
                        ignored = "◌",
                        unstaged = "✗",
                        staged = "✓",
                        conflict = "",
                    },
                },
            },
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_by_name = {
                        "node_modules",
                        ".git",
                    },
                },
                follow_current_file = {
                    enabled = true,
                },
                group_empty_dirs = true,
                hijack_netrw_behavior = "open_default",
                use_libuv_file_watcher = true,
            },
            window = {
                width = 32,
                mappings = {
                    ["<space>"] = "none",
                    ["<cr>"] = "open",
                    ["q"] = "close_window",
                    ["l"] = "open",
                    ["h"] = "close_node",
                    ["R"] = "refresh",
                },
            },
        })

        vim.keymap.set("n", "<leader>e", function()
            local ok, manager = pcall(require, "neo-tree.sources.manager")
            if not ok then
                vim.cmd("Neotree toggle filesystem left")
                return
            end
            local state = manager.get_state("filesystem")
            if state and state.winid and vim.api.nvim_win_is_valid(state.winid) then
                vim.cmd("Neotree close")
            else
                vim.cmd("Neotree toggle filesystem left")
            end
        end, { desc = "Toggle Neo-tree", silent = true })

        vim.keymap.set("n", "<leader>o", ":Neotree reveal<CR>", { desc = "Reveal current file", silent = true })
    end,
}
