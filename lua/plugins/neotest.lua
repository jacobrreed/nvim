return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      {
        "nvim-neotest/neotest-jest",
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
      },
    },
    vscode = false,
    opts = {
      adapters = {
        ["neotest-jest"] = {
          jestCommand = "yarn test --",
          env = { CI = true },
        },
      },
    },
  },
}
