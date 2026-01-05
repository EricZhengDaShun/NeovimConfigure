return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    require("nvim-treesitter").install({
      "c","cpp","cmake","python","lua","yaml","json","markdown","markdown_inline",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c","cpp","python","lua","yaml","json","markdown" },
      callback = function() vim.treesitter.start() end,
    })
  end,
}
