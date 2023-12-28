return {
  "nvim-neotest/neotest",
  cond = not vim.g.vscode,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-jest",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
          jestCommand = "yarn test --",
          jestConfig = "jest.config.js",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
      },
    })
  end,
  keys = {
    {
      "<leader>r",
      "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
      desc = "Run tests in current file",
    },
  },
}
