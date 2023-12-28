return {
  {
    "zbirenbaum/copilot.lua",
    cond = not vim.g.vscode,
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
      copilot_node_command = os.getenv("FNM_DIR") and vim.fn.expand("$FNM_DIR") .. "/aliases/default/bin/node"
        or "node",
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    cond = not vim.g.vscode,
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  { "AndreM222/copilot-lualine", cond = not vim.g.vscode },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cond = not vim.g.vscode,
    opts = {
      show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
      debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
      disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
    },
    build = function()
      vim.notify(
        "CopilotChat: Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim."
      )
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      {
        "<leader>ccv",
        ":CopilotChatVisual",
        mode = "x",
        desc = "CopilotChat - Open in vertical split",
      },
      {
        "<leader>ccx",
        ":CopilotChatInPlace<cr>",
        mode = "x",
        desc = "CopilotChat - Run in-place code",
      },
      {
        "<leader>ccf",
        "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
        desc = "CopilotChat - Fix diagnostic",
      },
      {
        "<leader>ccr",
        "<cmd>CopilotChatRefactor<cr>", -- Get a refactoring for the code under the cursor.
        desc = "CopilotChat - Refactor",
      },
      {
        "<leader>ccs",
        "<cmd>CopilotChatSuggest<cr>", -- Get a suggestion for the code under the cursor.
        desc = "CopilotChat - Suggest",
      },
      {
        "<leader>ccp",
        "<cmd>CopilotChatPrompt<cr>", -- Get a prompt for the code under the cursor.
        desc = "CopilotChat - Prompt",
      },
      {
        "<leader>ccr",
        "<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
        desc = "CopilotChat - Reset chat history and clear buffer",
      },
    },
  },
}
