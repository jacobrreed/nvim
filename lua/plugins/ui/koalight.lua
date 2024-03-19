return {
  "koalhack/koalight.nvim",
  priority = 1000,
  config = function()
    require("koalight")
    vim.cmd.colorscheme("koalight")
    local lualine = require("lualine")
    lualine.setup({
      options = {
        theme = "koalight",
      },
    })
  end,
}
