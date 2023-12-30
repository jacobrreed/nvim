return {
  "folke/which-key.nvim",
  opts = function()
    local wrap_toggle = function()
      return { "<cmd>set wrap!<cr>", "Toggle line wrapping" }
    end
    return {
      plugins = { spelling = true },
      defaults = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["gs"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader>"] = {
          ["<tab>"] = { name = "+tabs" },
          b = { name = "Buffer->" },
          l = { name = "LSP->" },
          c = {
            name = "Code->",
            c = {
              name = "Copilot->",
              t = { "<cmd>Copilot toggle<cr>", "Toggle" },
              p = { "<cmd>Copilot panel open<cr>", "Open panel" },
              a = { "<cmd>Copilot panel accept<cr>", "Accept current highlighted panel suggestion" },
              s = { "<cmd>Copilot status<cr>", "Status" },
            },
          },
          t = { name = "Telescope->" },
          f = { name = "Format->" },
          g = { name = "Git->" },
          q = {
            name = "Quit/Session/Save->",
            s = { "<cmd>SessionsSave<cr>", "Save Session" },
            l = { "<cmd>SessionsLoad<cr>", "Load Session" },
          },
          s = { name = "Search->" },
          u = {
            name = "UI->",
            w = wrap_toggle(),
          },
          W = {
            name = "Workspaces",
            l = { "<cmd>Telescope workspaces<cr>", "List Workspaces" },
            a = { "<cmd>WorkspacesAdd<cr>", "Add Workspace" },
            d = { "<cmd>WorkspacesRemove<cr>", "Delete Workspace" },
          },
          w = { name = "Windows->" },
          x = { name = "Diagnostics/Quickfix->" },
        },
      },
    }
  end,
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
