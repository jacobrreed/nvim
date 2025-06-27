return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim", branch = "master" },
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    chat = { adapter = "copilot" },
    inline = { adapter = "copilot" },
    cmd = { adapter = "copilot" },
    adapters = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "claude-3.7-sonnet",
            },
          },
        })
      end,
      -- gemini = function()
      --   return require("codecompanion.adapters").extend("gemini", {
      --     schema = {
      --       model = {
      --         default = "gemini-2.5-pro-exp-03-25",
      --       },
      --     },
      --   })
      -- end,
    },
  },
  keys = {
    { "<leader>aA", "<cmd>CodeCompanionActions<cr>", desc = "Actions" },
    { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", mode = "v", desc = "Chat toggle" },
    { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Chat toggle" },
    { "<leader>ai", "<cmd>CodeCompanion<cr>", desc = "Ask" },
    {
      "<leader>ac",
      function()
        local cmd = vim.fn.input({ prompt = "Neovim command to generate: " })
        vim.cmd("CodeCompanionCmd " .. cmd)
      end,
      desc = "Generate nvim command",
    },
  },
}
