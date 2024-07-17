return {
  dir = "~/dev/eldritch-workspace/eldritch.nvim",
  vscode = false,
  -- "eldritch-theme/eldritch.nvim",
  priority = 1000,
  opts = {
    transparent = true,
  },
  config = function(_, opts)
    local eldritch = require("eldritch")
    eldritch.setup(opts)
    vim.cmd([[colorscheme eldritch]])
  end,
}
