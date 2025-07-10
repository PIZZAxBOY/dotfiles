return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			-- You can customize some of the format options for the filetype (:help conform.format)
			-- rust = { "rustfmt", lsp_format = "fallback" },
			-- Conform will run the first available formatter
			-- stop_after_first 会在找到第一个格式化工具后就停止
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
		},

		-- 自动格式化
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 1000,
			-- 如果 format 不可用，切换回 lsp_fallback
			lsp_format = "fallback",
		},
	},
}
