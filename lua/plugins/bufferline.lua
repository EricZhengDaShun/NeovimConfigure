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

    vim.keymap.set("n", "]b", ":bnext<CR>", { silent = true, desc = "Next buffer" })
    vim.keymap.set("n", "[b", ":bprevious<CR>", { silent = true, desc = "Prev buffer" })

    vim.keymap.set(
      "n", 
      "<leader>c", 
      function()
       bufremove.delete(0, false)
      end, 
      { desc = "Close current buffer" }
    )

    -- 選擇並關閉 buffer (官方命令)
    vim.keymap.set("n", "<leader>bd", "<cmd>BufferLinePickClose<CR>", { desc = "Pick buffer to close" })
  end,
}


