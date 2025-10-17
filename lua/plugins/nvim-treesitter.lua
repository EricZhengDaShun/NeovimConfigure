return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
	        "c",
	        "cpp",
            "cmake",
	        "lua",
	        "yaml",
	        "json",
	        "vim",
	        "markdown",
	        "python",
        },
        auto_install = true,
        highlight = {
	        enable = true,
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end
}
