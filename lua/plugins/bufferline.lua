-- if true then return {} end

return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "echasnovski/mini.bufremove", 
  },
  config = function()
    local bufremove = require("mini.bufremove")

    require("bufferline").setup({
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        separator_style = "slant",
        show_buffer_close_icons = true,
        show_close_icon = false,
        close_command = function(n) bufremove.delete(n, false) end,
        right_mouse_command = function(n) bufremove.delete(n, false) end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    })

    local map = vim.keymap.set
    map("n", "]b", ":bnext<CR>", { silent = true, desc = "Next buffer" })
    map("n", "[b", ":bprevious<CR>", { silent = true, desc = "Prev buffer" })

    map("n", "<leader>bc", 
      function()
        bufremove.delete(0, false)
      end, 
      { desc = "Close current buffer" })

    map("n", "<leader>bd", "<cmd>BufferLinePickClose<CR>", { desc = "Pick buffer to close" })
    map('n', '<leader>bp', '<Cmd>BufferLinePick<CR>', { desc = '[B]uffer [P]ick' })
    map('n', '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', { desc = '[B]uffer Close [O]thers' })
  end,
}


