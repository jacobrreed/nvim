return {
  "Mofiqul/dracula.nvim",
  cond = not vim.g.vscode,
  lazy = false,
  priority = 1000,
  config = function()
    local dracula = require("dracula")
    dracula.setup({
      overrides = {
        BufferLineFill = { bg = "#282A36" },
        Visual = { bg = "#BD93F9", fg = "#F8F8F2" },
        TreesitterContextLineNumber = { fg = "#BD93F9" },
        TreesitterContextSeparator = { fg = "#BD93F9" },
        CursorLineNR = { fg = "#BD93F9" },
        AbsoluteColumn = { bg = "#44475A" },
        CurrentNumber = { fg = "#BD93F9" },
        IndentBlankLineScopeParent = { bg = "#83668A" },
        NotifyBackground = { bg = "none" },
        TelescopeNormal = { bg = "none" },
        NormalFloat = { bg = "none" },
        Transparent = { bg = "none" },
        WinBar = { bg = "none" },
      },
      colors = {
        visual = "#BD93F9",
      },
      lualine_bg_color = "#44475A",
      transparent_bg = true,
    })
  end,
}
