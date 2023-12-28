return {
  "kevinhwang91/nvim-bqf",
  cond = not vim.g.vscode,
  setup = function()
    vim.fn["fzf#install"]()
  end,
}
