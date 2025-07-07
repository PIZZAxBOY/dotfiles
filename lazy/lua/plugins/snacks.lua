return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
		lazygit = {
			enabled = true,
			configure = false,
		},
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = false },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
	keys = {
		--top picker
		{ "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },

		--buffer
		{ "<leader>c", function() require("snacks").bufdelete() end, desc = "[Snacks] Delete buffer" },

		--find
		{ "<leader>ff", function() require("snacks").picker.files() end, desc = "[Snacks] Find files" },
		{ "<leader>fb", function() require("snacks").picker.buffers() end, desc = "[Snacks] Buffers" },

		--LSP
	  { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },

		--git
		{ "<C-g>", function() require("snacks").lazygit() end, desc = "[Snacks] Lazygit" },
	},
	statuscolumn = {
		enabled = true,
		left = { "mark", "sign" }, -- priority of signs on the left (high to low)
		right = { "fold", "git" }, -- priority of signs on the right (high to low)
		folds = {
			open = true, -- show open fold icons
			git_hl = false, -- use Git Signs hl for fold icons
		},
		refresh = 50, -- refresh at most every 50ms
	},
	terminal = {
		enabled = true
	},
	words = {
		enabled = true
	},
	styles = {
		terminal = {
			relative = "editor",
			border = "rounded",
			position = "float",
			backdrop = 60,
			height = 0.9,
			width = 0.9,
			zindex = 50,
		},
}
}
