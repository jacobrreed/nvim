return {
  -- {
  --   "itchyny/vim-qfedit",
  --   vscode = false,
  -- },
  {
    "stevearc/quicker.nvim",
    event = "FileType qf",
    config = function()
      local quicker = require("quicker")
      vim.keymap.set("n", "<leader>q", function()
        quicker.toggle()
      end, {
        desc = "Toggle quickfix",
      })
      vim.keymap.set("n", "<leader>l", function()
        quicker.toggle({ loclist = true })
      end, {
        desc = "Toggle loclist",
      })
      quicker.setup({
        keys = {
          {
            ">",
            function()
              require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
            end,
            desc = "Expand quickfix context",
          },
          {
            "<",
            function()
              require("quicker").collapse()
            end,
            desc = "Collapse quickfix context",
          },
        },
      })
    end,
  },
  -- {
  --   "kevinhwang91/nvim-bqf",
  --   vscode = false,
  --   setup = function()
  --     vim.fn["fzf#install"]()
  --   end,
  --   opts = {
  --     preview = {
  --       winblend = 0,
  --     },
  --   },
  --   keys = {
  --     {
  --       "<leader>q",
  --       function()
  --         if vim.g.qf_is_open then
  --           vim.cmd("cclose")
  --           vim.g.qf_is_open = false
  --         else
  --           vim.cmd("copen")
  --           vim.g.qf_is_open = true
  --         end
  --       end,
  --       desc = "Quickfix Toggle",
  --     },
  --   },
  -- },
}
