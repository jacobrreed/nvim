return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    file_types = { "markdown", "copilot-chat", "rmd", "norg", "org" },
    preset = "obsidian",
    bullet = {
      right_pad = 1,
    },
    checkbox = {
      enabled = true,
      unchecked = { icon = "▢ " },
      checked = { icon = "✓ " },
      custom = { todo = { rendered = "◯ " } },
    },
  },
}
