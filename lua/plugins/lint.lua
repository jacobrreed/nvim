return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint = {
      linters_by_ft = {
        markdown = {},
        typescript = { "eslint" },
        lua = { "selene" },
      },
    }

    -- local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    --
    -- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    --   group = lint_augroup,
    --   callback = function()
    --     lint.tr
    --   end,
    -- })
  end,
}
