return {
  {
    "mrcjkb/rustaceanvim",
    cond = not vim.g.vscode,
    version = "^4", -- Recommended
    ft = { "rust" },
    config = function()
      vim.keymap.set("n", "<leader>ca", function()
        vim.cmd.RustLsp("codeAction")
      end, { silent = true, buffer = bufnr })
    end,
  },
  {
    "saecki/crates.nvim",
    tag = "stable",
    config = function()
      require("crates").setup()
    end,
  },
}
