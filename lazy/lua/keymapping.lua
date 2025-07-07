vim.keymap.set("n", "A-z", "<CMD>set wrap!<CR>", { desc = "Toggle line wrap" })

-- 窗口移动快捷键
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
