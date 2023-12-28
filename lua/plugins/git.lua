return {
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "▎" },
        delete = { text = "-" },
        topdelete = { text = "-" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
    },
  },
}
