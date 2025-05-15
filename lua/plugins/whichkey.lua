return {
  "folke/which-key.nvim",
  vscode = false,
  opts = {
    timeoutlen = 50,
    spec = {
      {
        mode = { "n", "v" },
        {
          "<leader>S",
          group = "snippet",
          mode = "v",
          icon = { icon = "✀ " },
        },
        {
          "<leader>m",
          group = "marks",
          mode = "n",
          icon = { icon = "" },
        },
      },
    },
  },
}
