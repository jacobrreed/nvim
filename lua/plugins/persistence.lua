return {
  "folke/persistence.nvim",
  vscode = false,
  keys = {
    {
      "<leader>Qs",
      function()
        require("persistence").load()
      end,
      desc = "Restore Session",
    },
    {
      "<leader>Ql",
      function()
        require("persistence").load({ last = true })
      end,
      desc = "Restore Last Session",
    },
    {
      "<leader>Qd",
      function()
        require("persistence").stop()
      end,
      desc = "Don't Save Current Session",
    },
    { "<leader>q", false },
    { "<leader>qs", false },
    { "<leader>ql", false },
    { "<leader>qd", false },
  },
}
