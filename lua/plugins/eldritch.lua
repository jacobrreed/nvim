return {
  "eldritch-theme/eldritch-nvim",
  priority = 2000,
  opts = {
    -- Sets transparent background
    -- If using lualine will also set transparent bg
    transparent_bg = true,
  },
  config = function(_, opts)
    local eldritch = require("eldritch")
    eldritch.setup(opts)
    vim.cmd("colorscheme eldritch")

    -- If using lualine
    require("lualine").setup({
      options = {
        theme = "eldritch",
      },
    })
  end,
}
