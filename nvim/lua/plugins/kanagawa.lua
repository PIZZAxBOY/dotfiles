return {
  "rebelot/kanagawa.nvim",
  branch = "master",
  config = function()
    require("kanagawa").setup {
      compile = true,
      transparent = false,
      background = {
        dark = "wave",
        light = "lotus",
      },

      --- 优化 markdown 语言高亮
      -- overrides = function(colors)
      -- 	return {
      -- 		["@markup.link.url.markdown_inline"] = { link = "Special" }, -- (url)
      -- 		["@markup.link.label.markdown_inline"] = { link = "WarningMsg" }, -- [label]
      -- 		["@markup.italic.markdown_inline"] = { link = "Exception" }, -- *italic*
      -- 		["@markup.raw.markdown_inline"] = { link = "String" }, -- `code`
      -- 		["@markup.list.markdown"] = { link = "Function" }, -- + list
      -- 		["@markup.quote.markdown"] = { link = "Error" }, -- > blockcode
      -- 		["@markup.list.checked.markdown"] = { link = "WarningMsg" }, -- - [X] checked list item
      -- 	}
      -- end,
    }
    vim.cmd "colorscheme kanagawa"
  end,
}
