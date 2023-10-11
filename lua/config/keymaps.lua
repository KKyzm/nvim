-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- do not jump when invoke '*'
vim.keymap.set("n", "*", ":keepjumps normal! mi*`i<Cr>")

-- Clear hlsearch with <esc>
vim.keymap.set("n", "<esc>", "<Cmd>nohlsearch<CR>", { desc = "clear hlsearch" })
