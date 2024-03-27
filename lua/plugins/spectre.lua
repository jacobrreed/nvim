return {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  build = "./build.sh nvim-oxi",
  opts = {
    live_update = true,
    mapping = {
      ["toggle_line"] = {
        map = "<Space>",
        cmd = "<cmd>lua require('spectre').toggle_line()<cr>",
        desc = "toggle line",
      },
    },
    default = {
      replace = {
        cmd = "oxi",
      },
    },
  },
  keys = {
    { "<leader>s", "<cmd>lua require('spectre').toggle()<cr>", desc = "Spectre (Search and Replace)", mode = "n" },
    {
      "<leader>s",
      "<cmd>lua require('spectre').open_visual({select_word=true})<cr>",
      desc = "Spectre (Search and Replace)",
      mode = "v",
    },
  },
}
