return {
  "folke/which-key.nvim",
  vscode = false,
  opts = {
    timeoutlen = 50,
    spec = {
      {
        mode = { "n", "v" },
        {
          "<leader>a",
          group = "+ai",
          icon = { icon = "󰚩" },
        },
        {
          "<leader>S",
          group = "snippet",
          mode = "v",
          icon = { icon = "✀ " },
        },
      },
    },
  },
}
