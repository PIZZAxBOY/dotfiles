return {
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override = {
        copilot = {
          icon = "",
          color = "#cba6f7", -- Catppuccin.mocha.mauve
          name = "Copilot",
        },
      },
    },
  },

	{'nvim-lualine/lualine.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
	opts = {
			options = {
				theme = "catppuccin",
				always_divide_middle = false,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = {},
        lualine_y = { "encoding", "fileformat", "filetype", "progress" },
        lualine_z = { "location" },
      },
      winbar = {
        lualine_a = { "filename", },
        lualine_b = { { function() return " " end, color = "Comment", }, },
        lualine_x = { "lsp_status", },
      },
      inactive_winbar = {
        -- Always show winbar
        -- stylua: ignore
        lualine_b = { function() return " " end, },
      },
		},
		    config = function(_, opts)
			local frappe = require("catppuccin.palettes").get_palette("frappe")

      local function show_macro_recording()
        local recording_register = vim.fn.reg_recording()
        if recording_register == "" then
          return ""
        else
          return "󰑋 " .. recording_register
        end
      end

      local macro_recording = {
        show_macro_recording,
        color = { fg = "#333333", bg = frappe.red },
        separator = { left = "", right = "" },
        padding = 0,
      }

      local copilot = {
        "copilot",
        show_colors = true,
        symbols = {
          status = {
            hl = {
              enabled = frappe.green,
              sleep = frappe.overlay0,
              disabled = frappe.surface0,
              warning = frappe.peach,
              unknown = frappe.red,
            },
          },
          spinner_color = frappe.mauve,
        },
      }

      table.insert(opts.sections.lualine_x, 1, macro_recording)
      table.insert(opts.sections.lualine_c, copilot)

      require("lualine").setup(opts)
    end,
  },

  {
    "romgrk/barbar.nvim",
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    lazy = false,
    -- stylua: ignore
    keys = {
      { "<[-b>", "<CMD>BufferPrevious<CR>",     mode = {"n"}, desc = "[Buffer] Previous buffer"   },
      { "<]-b>", "<CMD>BufferNext<CR>",         mode = {"n"}, desc = "[Buffer] Next buffer"       },
    },
    opts = {
      animation = true,
      -- Automatically hide the tabline when there are this many buffers left.
      -- Set to any value >=0 to enable.
      auto_hide = 1,

      -- Set the filetypes which barbar will offset itself for
      sidebar_filetypes = {
        NvimTree = true, -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>e", "<CMD>NvimTreeToggle<CR>", mode = { "n" }, desc = "[NvimTree] Toggle NvimTree" },
    },
    opts = {},
  },

	-- 不同括号的颜色区分
	{
    "HiPhish/rainbow-delimiters.nvim",
    main = "rainbow-delimiters.setup",
    submodules = false,
    opts = {},
  },

	  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- {"rcarriga/nvim-notify", opts = {background_colour = "#000000"}}
    },
    keys = {
      { "<leader>sN", "<CMD>Noice pick<CR>", desc = "[Noice] Pick history messages" },
      { "<leader>N", "<CMD>Noice<CR>", desc = "[Noice] Show history messages" },
    },

    opts = {
      popupmenu = {
        enabled = false,
      },
      notify = {
        enabled = false,
      },
      lsp = {

        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
          ["vim.lsp.util.stylize_markdown"] = false,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      routes = {
        -- Hide search count
        { filter = { event = "msg_show", kind = "search_count" }, opts = { skip = true } },
        -- Hide written message
        { filter = { event = "msg_show", kind = "" }, opts = { skip = true } },
      },
    },
  },
	  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      ---@type false | "classic" | "modern" | "helix"
      preset = "helix",
      win = {
        -- no_overlap = true,
        title = false,
        width = 0.5,
      },
      -- stylua: ignore
      spec = {
        { "<leader>cc", group = "<CodeCompanion>", icon = "" },
        { "<leader>s",  group = "<Snacks>"                    },
        { "<leader>t",  group = "<Snacks> Toggle"             },
      },
      -- expand all nodes wighout a description
      expand = function(node)
        return not node.desc
      end,
    },
    keys = {
      -- stylua: ignore
      { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "[Which-key] Buffer Local Keymaps", },
    },
  },
}
