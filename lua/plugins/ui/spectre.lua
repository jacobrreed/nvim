return {
  "nvim-pack/nvim-spectre",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    live_update = true,
  },
  key = {
    { "<leader>st", '<cmd>lua require("spectre").toggle()<CR>', desc = "Toggle Spectre", mode = "n" },
    {
      "<leader>sw",
      '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
      desc = "Search current word",
      mode = "n",
    },
    {
      "<leader>sp",
      '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
      desc = "Search on current file",
      mode = "n",
    },
  },
}
