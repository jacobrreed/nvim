return {
  "folke/which-key.nvim",
  vscode = false,
  opts = {
    preset = "helix",
    timeoutlen = 0,
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
          group = "+snippet",
          mode = "v",
          icon = { icon = "✀ " },
        },
        {
          "<leader>c",
          group = "+code",
          icon = { icon = " " },
        },
        {
          "<leader>f",
          group = "+find",
          icon = { icon = "󰍉 " },
        },
        {
          "<leader>g",
          group = "+git",
          icon = { icon = " " },
        },
        {
          "<leader>s",
          group = "+snacks",
          icon = { icon = "󰆘 " },
        },
        {
          "<leader>u",
          group = "+ui",
          icon = { icon = "󰍹 " },
        },
        {
          "<leader>w",
          group = "+window",
          icon = { icon = " " },
        },
        {
          "<leader>x",
          group = "+trouble",
          icon = { icon = " " },
        },
      },
    },
  },
}
