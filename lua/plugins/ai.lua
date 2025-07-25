return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    opts = {
      strategies = {
        chat = { adapter = "copilot" },
        inline = { adapter = "copilot" },
        roles = {
          user = " ",
          llm = function(_)
            return " "
          end,
        },
        tools = {
          opts = {
            auto_submit_errors = true,
            auto_submit_success = false,
            -- default_tools = { "full_stack_dev" },
          },
          ["cmd_runner"] = { opts = { requires_approval = false } },
        },
      },
      adapters = {
        tavily = function()
          return require("codecompanion.adapters").extend("tavily", {
            env = {
              api_key = vim.env.TAVILY_API_KEY,
            },
          })
        end,
        opts = {
          show_model_choices = true,
        },
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
  {
    "ellisonleao/dotenv.nvim",
    opts = {
      enable_on_load = true,
      verbose = false,
    },
  },
}
