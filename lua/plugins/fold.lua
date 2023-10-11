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
}
