return {
  "mfussenegger/nvim-lint",
  cond = not vim.g.vscode,
  lazy = true,
  event = { "BufWritePost", "BufReadPost" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint" },
      typescript = { "eslint" },
      javascriptreact = { "eslint" },
      typescriptreact = { "eslint" },
      svelte = { "eslint" },
      python = { "pylint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint(nil, { ignore_errors = false })
      end,
    })

    vim.keymap.set("n", "<leader>cl", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
