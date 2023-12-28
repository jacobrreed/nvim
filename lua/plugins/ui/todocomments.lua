return {
  "folke/todo-comments.nvim",
  cond = not vim.g.vscode,
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = true, -- show icons in the signs column
    merge_keywords = false, -- use only these
    keywords = {
      BUG = { icon = "", color = "error" },
      FIXME = { icon = "", color = "error" },
      HACK = { icon = "", color = "info" },
      NOTE = { icon = "❦", color = "info" },
      TODO = { icon = "★", color = "actionItem" },
      WARN = { icon = "󰀦", color = "warning" },
      WARNING = { icon = "󰀦", color = "warning" },
    },
    colors = {
      actionItem = { "ActionItem", "#F1FA8C" },
      default = { "Identifier", "#50FA7B" },
      error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#FF5555" },
      info = { "LspDiagnosticsDefaultInformation", "#F8F8F2" },
      warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FFB86C" },
    },
    highlight = {
      keyword = "bg",
      pattern = [[.*<(KEYWORDS)\s*]],
    },
    search = {
      command = "rg",
      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },
      pattern = [[\b(KEYWORDS)\b]],
    },
  },
  keys = {
    { "<leader>tt", "<cmd>TodoTelescope keywords=TODO<cr>", desc = "TODO list" },
  },
}
