vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory in Oil" })
vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open diagnostics in float" })

vim.keymap.set("n", "<Leader>cf", function()
	require("conform").format({
		lsp_format = "fallback",
	})
end, { desc = "Format current file" })



-- 自动格式化快捷键

vim.keymap.set("n", "<Leader>tf", "<CMD>FormatDisable<CR>",
	{ desc = "Turn off auto format" })

vim.keymap.set("n", "<leader>tF", ":FormatDisable!<CR>",
	{ desc = "Turn off auto format for current buffer" })

vim.keymap.set("n", "<leader>ta", ":FormatEnable<CR>",
	{ desc = "Turn on auto format" })



-- 添加换行快捷键
vim.keymap.set("n", "<Leader>tw", "<CMD>set wrap!<CR>", { desc = "Toggle wrap" })
