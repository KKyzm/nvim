-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- do not jump when invoke '*'
vim.keymap.set("n", "*", ":keepjumps normal! mi*`i<Cr>")

-- Clear hlsearch with <esc>
vim.keymap.set("n", "<esc>", "<Cmd>nohlsearch<CR>", { desc = "clear hlsearch" })

-- Copy diagnose message of current line only into system clipboard
vim.keymap.set("n", "yd", function()
  local line_nr, col_nr = unpack(vim.api.nvim_win_get_cursor(0))
  local diagnoses = vim.diagnostic.get(0)
  if next(diagnoses) == nil then
    vim.notify("No diagnose message avaliable", vim.log.levels.WARN)
    return
  end
  for _, diagnose in ipairs(diagnoses) do
    if diagnose.lnum + 1 == line_nr and diagnose.col == col_nr then
      vim.fn.setreg("+", diagnose.message)
      vim.notify('"' .. diagnose.message .. '"', vim.log.levels.INFO, { title = "Diagnose message copied" })
      break
    end
  end
end, {
  desc = "Copy diagnose message",
})
