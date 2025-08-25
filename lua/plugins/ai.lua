return {
  {
    "zbirenbaum/copilot.lua",
    -- dir = "~/dev/copilot.lua",
    event = "InsertEnter",
    opts = {
      filetypes = { markdown = false, help = false },
      copilot_node_command = vim.fn.expand("$FNM_DIR") .. "/node-versions/v22.13.0/installation/bin/node",
    },
  },
  {
    "AndreM222/copilot-lualine",
    dependencies = { "zbirenbaum/copilot.lua" },
  },
  -- Using codecompanion now, leaving here in case I switch back
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   opts = {
  --     auto_insert_mode = false,
  --     model = "claude-3.7-sonnet",
  --     highlight_headers = false,
  --     show_diff = {
  --       full_diff = true,
  --     },
  --     question_header = "#   Me",
  --     answer_header = "#   Copilot Chat",
  --     error_header = "> [!ERROR]  ",
  --     mappings = {
  --       reset = {
  --         normal = "<C-S-l>",
  --         insert = "<C-S-l>",
  --       },
  --       complete = {
  --         insert = "<tab>",
  --       },
  --     },
  --   },
  --   keys = {
  --     {
  --       "<leader>as",
  --       function()
  --         vim.ui.input({ prompt = "Save Copilot Chat (name): " }, function(input)
  --           vim.cmd("CopilotChatSave " .. input)
  --         end)
  --       end,
  --       desc = "Save chat",
  --     },
  --     {
  --       "<leader>al",
  --       function()
  --         vim.api.nvim_input("<Esc>:CopilotChatLoad ")
  --       end,
  --       desc = "Load chat",
  --     },
  --     {
  --       "<leader>aA",
  --       "<cmd>CopilotChatAgents<cr>",
  --       desc = "Agents",
  --     },
  --     {
  --       "<leader>am",
  --       "<cmd>CopilotChatModels<cr>",
  --       desc = "Models",
  --     },
  --     {
  --       "<leader>aS",
  --       "<cmd>CopilotChatStop<cr>",
  --       desc = "Stop",
  --     },
  --   },
  -- },
  {
    "olimorris/codecompanion.nvim",

    lazy = true,
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
