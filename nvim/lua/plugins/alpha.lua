---
return {
  "goolord/alpha-nvim",
  dependencies = {
    "nikvdp/fortune.nvim",
  },
  config = function()
    local alpha = require "alpha"
    local dashboard = require "alpha.themes.dashboard"

    dashboard.section.header.val = {
      [[                               __                ]],
      [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
      [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
      [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
      [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
      [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button(
        "c",
        "  Neovim Config",
        function() require("fzf-lua").files { cwd = vim.fn.stdpath "config" } end
      ),
      dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
    }

    alpha.setup(dashboard.config)
  end,
}
