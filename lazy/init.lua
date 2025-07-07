vim.wo.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
-- Display tabs and trailing spaces
vim.opt.list = true
vim.opt.listchars = { tab = ">-", trail = "-"}
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

require("config.lazy")
require("keymapping")
