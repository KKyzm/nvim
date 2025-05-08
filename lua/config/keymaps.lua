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

-- User commands

local function extract_unique_thread_ids()
  local buf = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  local thread_ids_map = {}
  -- local pattern = "%[thread (%d+)%]"
  local pattern = "Peer #(%d+)"
  -- local pattern = "Server #(%d+)"
  -- local pattern = "ShardCtrler #(%d+)"

  for line_num, line in ipairs(lines) do
    local thread_id = line:match(pattern)
    if thread_id then
      if not thread_ids_map[thread_id] then
        thread_ids_map[thread_id] = {}
      end
      table.insert(thread_ids_map[thread_id], line_num)
    end
  end

  return thread_ids_map
end

local function create_highlight_groups(thread_ids)
  local nvim_command = vim.api.nvim_command
  local colors =
    { "Directory", "Character", "Statement", "NvimSingleQuotedQuote", "WarningMsg", "markdownH5", "NeoTreeTabActive" }
  local highlight_groups = {}
  local color_count = #colors
  local index = 1

  for thread_id, _ in pairs(thread_ids) do
    local hl_group = "ThreadID" .. thread_id
    highlight_groups[thread_id] = hl_group
    -- nvim_command("highlight " .. hl_group .. " guifg=" .. colors[index])
    nvim_command("highlight link " .. hl_group .. " " .. colors[index])
    index = (index % color_count) + 1
  end

  return highlight_groups
end

-- Function to set highlight for each line based on thread_id
local function set_highlight_for_lines(thread_ids, highlight_groups)
  local buf = vim.api.nvim_get_current_buf()
  for thread_id, lines in pairs(thread_ids) do
    local hl_group = highlight_groups[thread_id]
    for _, line_num in ipairs(lines) do
      vim.api.nvim_buf_add_highlight(buf, -1, hl_group, line_num - 1, 0, -1)
    end
  end
end

-- Main function to extract thread IDs, create highlight groups, and set highlights
local function render_multithread_log()
  local thread_ids_map = extract_unique_thread_ids()
  local highlight_groups = create_highlight_groups(thread_ids_map)
  set_highlight_for_lines(thread_ids_map, highlight_groups)
end

-- Create a user command to run the highlight_threads_in_buffer function
vim.api.nvim_create_user_command("RenderMultiThreadLog", render_multithread_log, {})
