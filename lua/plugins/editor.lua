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

  -- better chinese input experience
  { "h-hg/fcitx.nvim", event = "VeryLazy" },

  -- makes some plugins dot-repeatable like leap
  { "tpope/vim-repeat", event = "VeryLazy" },
}
