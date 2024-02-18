return {
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
