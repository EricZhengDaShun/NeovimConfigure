return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        vim.lsp.config["clangd"] = {
            cmd = { "clangd", "--background-index", "--clang-tidy" },
            filetypes = { "c", "cpp", "objc", "objcpp" },
            root_markers = { "compile_commands.json", ".git" },
            capabilities = capabilities,
        }

        vim.lsp.config["neocmake"] = {
            cmd = { "neocmakelsp", "--stdio" },
            filetypes = { "cmake" },
            root_markers = { "CMakeLists.txt", ".git" },
            capabilities = capabilities,
        }

        vim.lsp.config["lua_ls"] = {
            cmd = { "lua-language-server" },
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    workspace = { checkThirdParty = false },
                },
            },
            capabilities = capabilities,
        }

        vim.lsp.config["basedpyright"] = {
            cmd = { "basedpyright-langserver", "--stdio" },
            filetypes = { "python" },
            root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                        diagnosticMode = "workspace",
                    },
                },
            },
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        }

        vim.lsp.config["jsonls"] = {
            cmd = { "vscode-json-language-server", "--stdio" },
            filetypes = { "json", "jsonc" },
            settings = {
                json = {
                    schemas = {
                        {
                            description = "CMake Presets",
                            fileMatch = { "CMakePresets.json", "CMakeUserPresets.json" },
                            url = "https://gitlab.kitware.com/cmake/cmake/-/raw/v3.22.0/Help/manual/presets/schema.json",
                        },
                    },
                },
            },
            capabilities = capabilities,
        }

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "c", "cpp", "objc", "objcpp" },
            callback = function()
                vim.lsp.start(vim.lsp.config["clangd"])
            end,
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "cmake" },
            callback = function()
                vim.lsp.start(vim.lsp.config["neocmake"])
            end,
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "lua" },
            callback = function()
                vim.lsp.start(vim.lsp.config["lua_ls"])
            end,
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "python" },
            callback = function()
                vim.lsp.start(vim.lsp.config["basedpyright"])
            end,
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "json", "jsonc" },
            callback = function()
                vim.lsp.start(vim.lsp.config["jsonls"])
            end,
        })
    end,
}
