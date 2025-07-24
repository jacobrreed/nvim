return {
  "folke/which-key.nvim",
  vscode = false,
  opts = {
    preset = "helix",
    timeoutlen = 0,
    spec = {
      {
        mode = { "n" },
        {
          "<leader>w",
          group = "+window",
          icon = { icon = " " },
        },
      },
    },
  },
}
