return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  event = {
    "BufReadPre ~/dev/notes/**.md",
    "BufNewFile ~/dev/notes/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/dev/notes",
      },
    },
  },
  keys = {
    { "<leader>oo", "<cmd>Obsidian" },
  },
}
