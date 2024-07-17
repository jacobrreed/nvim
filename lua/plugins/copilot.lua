return {
  {
    "zbirenbaum/copilot.lua",
    vscode = false,
    opts = {
      filetypes = {
        markdown = false,
        help = false,
      },
      copilot_node_command = vim.fn.expand("$FNM_DIR") .. "/node-versions/v18.18.0/installation/bin/node",
    },
  },
  {
    "AndreM222/copilot-lualine",
    vscode = false,
  },
}
