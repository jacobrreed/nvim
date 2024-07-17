return {
  "folke/which-key.nvim",
  opts = {
    preset = "modern",
    delay = 0,
    spec = {
      {
        mode = { "n", "v" },
        { "<leader>C", group = "Copilot", icon = " " },
        { "<leader>Ca", "<cmd>Copilot panel accept<cr>", desc = "Accept current highlighted panel suggestion" },
        { "<leader>Cp", "<cmd>Copilot panel open<cr>", desc = "Open panel" },
        { "<leader>Cs", "<cmd>Copilot status<cr>", desc = "Status" },
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
