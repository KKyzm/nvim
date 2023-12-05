return {
  "stevearc/conform.nvim",
  opts = {
    ---@type table<string, conform.FormatterUnit[]>
    formatters_by_ft = {
      python = { "black" },
      xml = { "xmlformat" },
    },
  },
}
