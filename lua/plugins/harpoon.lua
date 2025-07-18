return {
  "ThePrimeagen/harpoon",
  enabled = false,
  branch = "harpoon2",
  dependences = { "nvim-lua/plenary.nvim" },
  keys = function()
    local wk = require("which-key")
    wk.add({ { "<leader>m", group = "Harpoon", icon = "" } })
    local harpoon = require("harpoon")
    return {
      {
        "<leader>ma",
        function()
          harpoon:list():add()
        end,
        desc = "add",
      },
      {
        "<leader>ml",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "list",
      },
      {
        "<S-l>",
        function()
          harpoon:list():next()
        end,
        desc = "next",
      },
      {
        "<S-h>",
        function()
          harpoon:list():prev()
        end,
        desc = "prev",
      },
    }
  end,
}
