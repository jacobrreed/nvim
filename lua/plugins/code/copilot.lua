return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = {
      "BufEnter",
      "BufReadPre",
      "InsertEnter",
    },
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
      -- Sets node version to current FastNodeManager default set version
      copilot_node_command = vim.fn.expand("$FNM_DIR") .. "/aliases/default/bin/node",
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  "AndreM222/copilot-lualine",
}
