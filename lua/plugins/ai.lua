return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    opts = {
      display = { chat = { auto_scroll = true, show_settings = false } },
      strategies = {
        chat = {
          tools = {
            opts = {
              auto_submit_errors = true,
              auto_submit_success = false,
              -- default_tools = { "full_stack_dev" },
            },
            ["cmd_runner"] = { opts = { requires_approval = false } },
          },
        },
      },
      chat = { adapter = "copilot" },
      inline = { adapter = "copilot" },
      cmd = { adapter = "copilot" },
      adapters = {
        opts = {
          show_model_choices = true,
        },
        copilot = function()
          return require("codecompanion.adapters").extend("copilot", {
            schema = {
              model = {
                -- default = "claude-3.7-sonnet",
                default = "gpt-4.1",
              },
            },
          })
        end,
      },
    },
    keys = function()
      local wk = require("which-key")
      wk.add({ { "<leader>a", group = "+ai", icon = { icon = "󰚩" } } })
      return {
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
      }
    end,
  },
}
