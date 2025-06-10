return {
  "L3MON4D3/LuaSnip",
  config = function()
    local path = vim.fs.joinpath(vim.fn.stdpath("config"), "lua", "snippets", "mjml.lua")
    if vim.fn.filereadable(path) == 1 then
      dofile(path)
    else
      print("错误：代码片段文件未找到: " .. path)
    end
  end,
}
