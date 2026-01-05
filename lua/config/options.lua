vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

vim.opt.list = true
vim.opt.listchars = {
  tab = "»·",
  trail = "·",
  extends = "›",
  precedes = "‹",
  nbsp = "␣",
  space = "·",
}

vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  callback = function()
    vim.opt.relativenumber = false
  end,
})
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  callback = function()
    vim.opt.relativenumber = true
  end,
})
