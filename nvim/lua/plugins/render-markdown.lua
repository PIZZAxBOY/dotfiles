return {
  "MeanderingProgrammer/render-markdown.nvim",
  -- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
  -- dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  config = function()
    require("render-markdown").setup {
      completions = { blink = { enabled = true } },
      sign = {
        enabled = false,
      },
      quote = {
        repeat_linebreak = true,
      },
      pipe_table = {
        cell = "trimmed",
        preset = "round",
      },
      code = {
        language_name = false,
      },
    }
  end,
}
