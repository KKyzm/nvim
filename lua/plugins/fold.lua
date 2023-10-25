return {
  -- modern Neovim fold
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    },
    event = { "BufReadPost", "BufNewFile" },
    -- stylua: ignore
    keys = {
      { "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
      { "zR", function() require("ufo").openAllFolds() end, desc = "Open all folds" },
    },
    config = function()
      require("ufo").setup()
    end,
  },

  -- fold preview
  {
    "anuvyklack/fold-preview.nvim",
    event = "VeryLazy",
    dependencies = "anuvyklack/keymap-amend.nvim",
    config = function()
      local fp = require("fold-preview")
      local keymap = vim.keymap
      keymap.amend = require("keymap-amend")

      fp.setup({
        border = "single",
        default_keybindings = false,
      })

      keymap.amend("n", "h", function(original)
        if not fp.toggle_preview() then
          original()
        end
      end)
    end,
  },
}
