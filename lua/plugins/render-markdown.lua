return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "codecompanion", "Avante", "markdown", "copilot-chat", "rmd", "norg", "org" },
  opts = {
    anti_conceal = {
      enabled = true,
      ignore = {
        code_background = true,
        sign = true,
      },
    },
    completions = { blink = { enabled = true } },
    preset = "obsidian",
    bullet = {
      right_pad = 1,
    },
    checkbox = {
      enabled = true,
      unchecked = { icon = "▢ " },
      checked = { icon = "✓ " },
      custom = { todo = { rendered = "◯ " } },
      right_pad = 1,
    },
  },
}
