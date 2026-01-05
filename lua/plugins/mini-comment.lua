return {
  "nvim-mini/mini.comment",
  version = false,
  opts = {
    mappings = {
      comment = "gc",
      textobject = "gc",

      comment_line = "<leader>/",
      comment_visual = "<leader>/",
    },
  },
  config = function(_, opts)
    require("mini.comment").setup(opts)
  end,
}
