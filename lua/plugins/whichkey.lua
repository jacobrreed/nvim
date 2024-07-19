return {
  "folke/which-key.nvim",
  lazy = false,
  opts = {
    preset = "modern",
    delay = 0,
    spec = {
      {
        mode = { "n", "v" },
        { "<leader>W", group = "Workspaces", icon = " " },
        { "<leader>Wa", "<cmd>WorkspacesAdd<cr>", desc = "Add Workspace" },
        { "<leader>Wd", "<cmd>WorkspacesRemove<cr>", desc = "Delete Workspace" },
        { "<leader>Wl", "<cmd>Telescope workspaces<cr>", desc = "List Workspaces" },
        { "<leader>R", "", desc = "+Rest", icon = "󰛶 " },
        { "<leader>K", "<cmd>norm! K<cr>", desc = "Keywordprg", icon = " " },
        { "<leader>t", group = "Telescope", icon = " " },
        { "<leader>Q", group = "Session", icon = " " },
      },
    },
  },
}
