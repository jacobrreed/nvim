return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/dev/vault/*.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/dev/vault/*.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/dev/vault",
      },
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
  },
}
