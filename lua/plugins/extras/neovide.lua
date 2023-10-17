if vim.g.neovide then
  return {

    { "echasnovski/mini.animate", enabled = false },

    { "lukas-reineke/headlines.nvim", enabled = false },
  }
else
  return {}
end
