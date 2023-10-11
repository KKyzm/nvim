return {
  -- structured note taking
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    event = { "BufReadPre *.norg", "BufNewFile *.norg" },
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
        },
      })
    end,
  },
}
