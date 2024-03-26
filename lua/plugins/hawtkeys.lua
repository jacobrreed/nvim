return {
  "tris203/hawtkeys.nvim",
  cond = not vim.g.vscode,
  config = true,
  keys = {
    { "<leader>hh", "<cmd>Hawtkeys<cr>", desc = "Hawtkeys" },
    { "<leader>ha", "<cmd>HawtkeysAll<cr>", desc = "Hawtkeys All" },
    { "<leader>hd", "<cmd>HawtkeysDupes<cr>", desc = "Hawtkeys Duplicates" },
  },
}
