return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      {
        "nvim-neotest/neotest-jest",
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
