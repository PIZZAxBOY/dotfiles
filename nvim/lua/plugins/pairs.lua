-- return {
--   "echasnovski/mini.pairs",
--   version = false,
--   config = function() require("mini.pairs").setup() end,
-- }
--
return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = true,
  -- use opts = {} for passing setup options
  -- this is equivalent to setup({}) function
}
