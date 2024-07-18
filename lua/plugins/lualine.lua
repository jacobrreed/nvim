return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    local opts = {
      options = {
        theme = "eldritch",
        component_separators = "|",
        section_separators = { left = "", right = "" },
        icons_enabled = true,
        globalstatus = true,
        refresh = { statusline = 1000, tabline = 1000 },
        disabled_filetypes = { statusline = { "dashboard" }, tabline = { "dashboard" } },
      },
      extensions = { "neo-tree", "lazy" },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_x = {
          {
            "copilot",
            show_loading = true,
            show_colors = true,
            padding = { right = 1, left = 1 },
            symbols = {
              status = {
                icons = {
                  enabled = " ",
                  sleep = " ", -- auto-trigger disabled
                  disabled = " ",
                  warning = " ",
                  unknown = " ",
                },
                hl = {
                  sleep = "#50FA7B",
                },
              },
            },
          },
        },
        lualine_y = {
          -- { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 1, right = 1 } },
        },
        lualine_z = {
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
          },
        },
      },
    }

    return opts
  end,
  dependencies = { "nvim-tree/nvim-web-devicons", "eldritch-theme/eldritch.nvim" },
}
