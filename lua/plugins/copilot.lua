return {
  { "AndreM222/copilot-lualine" },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    event = {
      "BufEnter",
      "BufReadPre",
      "InsertEnter",
    },
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    config = function()
      require("CopilotChat").setup({})
    end,
    keys = {
      { "<leader>Ct", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
      {
        "<leader>Cc",
        function()
          local input = vim.fn.input("Ask Copilot: ")
          vim.cmd("CopilotChat " .. input .. "?")
        end,
        desc = "CopilotChat - Chat",
      },
      { "<leader>Ce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>Cr", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
      { "<leader>Cf", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix diagnostic" },
      { "<leader>CF", "<cmd>CopilotChatFix<cr>", desc = "CopilotChat - Fix code", mode = "v" },
      { "<leader>Ce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>CT", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      { "<leader>Ct", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
      {
        "<leader>Cf",
        "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
        desc = "CopilotChat - Fix diagnostic",
      },
    },
  },
}
