return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "mason-org/mason.nvim" },
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- lua
				"lua-language-server",
				"stylua",

				-- c, cpp
				"clangd",
				"clang-format",
                "codelldb",
                -- cmake
                "cmakelint",
				"neocmakelsp",

				-- python
				"basedpyright",
				"isort",
				"black",
			},
		})
	end,
}
