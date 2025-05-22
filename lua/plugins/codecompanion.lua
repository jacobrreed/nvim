return {
  "olimorris/codecompanion.nvim",
  opts = {
    chat = { adapter = "gemini" },
    inline = { adapter = "gemini" },
    cmd = { adapter = "gemini" },
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
