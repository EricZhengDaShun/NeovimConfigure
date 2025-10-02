return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "mason-org/mason.nvim" },
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- lua
				"lua_ls",
				"stylua",

				-- c, cpp
				"clangd",
				"clang-format",
                "codelldb",
                -- cmake
                "cmakelint",

				-- python
				"pyright",
				"isort",
				"black",
			},
		})
	end,
}
