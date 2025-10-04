return {
	"numToStr/Comment.nvim",
	event = "VeryLazy",
	opts = {
        toggler = {
            line = "<leader>/",
        },
        opleader = {
            line = "<leader>/",
        },
	},
	config = function(_, opts)
		require("Comment").setup(opts)
	end,
}
