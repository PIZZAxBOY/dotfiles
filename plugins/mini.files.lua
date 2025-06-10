return {
  {
    "echasnovski/mini.files",
    version = false,
    keys = {
      {
        "<leader>e",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "File Explorer (mini.files)",
      },
    },
    opts = {
      windows = {
        preview = true,
        width_focus = 40,
        width_preview = 80,
      },
    },
    config = function(_, opts)
      require("mini.files").setup(opts)

      -- 使用快捷键 q 关闭
      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          vim.keymap.set("n", "q", "<cmd>q<cr>", { buffer = args.data.buf_id })
        end,
      })
    end,
  },
}
