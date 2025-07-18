vim.keymap.set("n", "-", "<CMD>lua MiniFiles.open(nil)<CR>", { desc = "Open parent directory in MiniFiles" })
vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, { desc = "Open diagnostics in float" })

-- 格式化当前文档
vim.keymap.set(
  "n",
  "<Leader>cf",
  function()
    require("conform").format {
      lsp_format = "fallback",
    }
  end,
  { desc = "Format current file" }
)

-- 添加换行快捷键
vim.keymap.set("n", "<leader>tw", "<CMD>set wrap!<CR>", { desc = "Toggle wrap" })
