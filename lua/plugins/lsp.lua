return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.diagnostic.config({
				virtual_text = true, -- 啟用虛擬文字
				signs = true, -- 在左側 gutter 顯示圖示
				underline = true, -- 為有問題的程式碼加上底線
				update_in_insert = false, -- 是否在插入模式下即時更新 (預設為 false)
				severity_sort = true, -- 根據嚴重性排序，優先顯示錯誤
			})

			local on_attach = function(client, bufnr)
				local map = function(mode, lhs, rhs, desc)
					vim.keymap.set(
						mode,
						lhs,
						rhs,
						{ noremap = true, silent = true, buffer = bufnr, desc = "LSP: " .. desc }
					)
				end
				map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
				map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
				map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
				map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
				map("n", "gr", vim.lsp.buf.references, "Go to References")
			end

			local lsp_augroup = vim.api.nvim_create_augroup("UserLspConfig", { clear = true })
			vim.api.nvim_create_autocmd("LspAttach", {
				group = lsp_augroup,
				callback = function(ev)
					on_attach(nil, ev.buf)
				end,
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "clangd", "lua_ls" },
		},
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = require("cmp_nvim_lsp").default_capabilities(),
					})
				end,
			})
		end,
	},
}
