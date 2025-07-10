vim.opt.breakindent = true -- 控制长行换行的缩进逻辑

vim.opt.expandtab = true
vim.opt.shiftwidth = 2 -- 使用 >> 或 > 时候缩进的距离

vim.opt.tabstop = 2 -- 展示多少个缩进
vim.opt.softtabstop = 2 -- 设置为 -1 自动匹配 shiftwidth

vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true -- 保持上一行的缩进

-- 显示相对行号
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true -- 突出显示当前行

-- 保存历史编辑记录
vim.opt.undofile = true

-- 光标模式
vim.opt.mouse = "a"

-- 如果已经有 statusline 插件，就可以隐藏当前模式
vim.opt.showmode = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 始终显示标记栏
vim.opt.signcolumn = "yes"

-- 默认分屏方向
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = ">-", trail = ".", nbsp = "␣" }

vim.opt.scrolloff = 5

--  高亮复制的内容
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

--  和系统同步剪贴板
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)
