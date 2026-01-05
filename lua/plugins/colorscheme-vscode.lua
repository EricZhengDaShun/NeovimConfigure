return {
  "Mofiqul/vscode.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.opt.termguicolors = true
    require("vscode").setup({})
    vim.cmd.colorscheme("vscode")
  end,
}
