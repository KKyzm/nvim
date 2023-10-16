-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.exrc = true -- Project-specific configuration

if vim.g.neovide then
  opt.guifont = "Maple Mono:h7.5"
end
