-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("custom_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("BufRead", {
  group = augroup("highlight_routing_table"),
  pattern = { "*.rt" },
  callback = function(event)
    local function set_default(t, d)
      -- stylua: ignore
      local mt = {__index = function () return d end}
      setmetatable(t, mt)
    end
    local hi = {}
    set_default(hi, "NonText")
    hi["+R"] = "String"
    hi["-R"] = "Error"
    hi["*R"] = "Question"
    hi["+I"] = "String"
    hi["-I"] = "Error"
    hi["*I"] = "Question"
    local ns_id = vim.api.nvim_create_namespace("highlight_routing_table")
    local nrs = vim.api.nvim_buf_line_count(event.buf)
    for line_nr = 0, nrs - 1 do
      local lines = vim.api.nvim_buf_get_lines(event.buf, line_nr, line_nr + 1, false)
      local line = unpack(lines)
      local tag = string.sub(line, 1, 2)
      vim.api.nvim_buf_add_highlight(event.buf, ns_id, hi[tag], line_nr, 0, -1)
    end
  end,
})
