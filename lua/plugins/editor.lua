return {
  -- add dependency nvim-window-picker for nvim-neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      {
        "s1n7ax/nvim-window-picker",
        name = "window-picker",
        version = "2.*",
        config = function()
          require("window-picker").setup({
            hint = "floating-big-letter",
            show_prompt = false,
          })
        end,
      },
    },
  },

  -- add some keymap related to buffer delete
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Close other buffers" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Close left buffers" },
      { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Close right buffers" },
    },
  },

  -- <tab> to jump out of brackets
  {
    "abecodes/tabout.nvim",
    event = "InsertEnter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      -- tabout should be loaded after those plugins
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("tabout").setup({
        tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = "<C-d>", -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = true, -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
          { open = "<", close = ">" },
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {}, -- tabout will ignore these filetypes
      })
    end,
  },

  -- better chinese input experience
  { "h-hg/fcitx.nvim", event = "VeryLazy" },

  -- makes some plugins dot-repeatable like leap
  { "tpope/vim-repeat", event = "VeryLazy" },

  -- distraction-free coding
  { "folke/zen-mode.nvim", cmd = "ZenMode" },

  -- easy align
  {
    "echasnovski/mini.align",
    event = "VeryLazy",
    version = "*",
    config = function()
      require("mini.align").setup()
    end,
  },

  -- incremental selection
  {
    "sustech-data/wildfire.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("wildfire").setup()
    end,
  },
}
