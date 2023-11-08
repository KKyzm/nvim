return {
  -- structured note taking
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    ft = "norg",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/workspaces/notes",
              },
            },
          },
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
        },
      })
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    optional = true,
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "neorg",
        group_index = 1,
      })
    end,
  },
}
