return {
  { import = "lazyvim.plugins.extras.editor.aerial" },

  {
    "stevearc/aerial.nvim",
    opts = {
      layout = {
        -- max width is the lesser of 40 cols or 30% of total
        max_width = { 40, 0.3 },
        -- min width is the greater of 20 cols or 20% of total
        min_width = { 20, 0.2 },
      },
    },
  },
}
