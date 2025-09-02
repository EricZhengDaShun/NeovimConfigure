return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "c",
      "cpp",
      "lua",
      "python",
      "cmake",
      "yaml",
      "json",
      "markdown",
      "vim",
      "vimdoc",
      "sql",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",    
      "gitignore",  
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
  },
}
