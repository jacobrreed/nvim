return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier_d" },
        typescript = { "prettier_d" },
        javascriptreact = { "prettier_d" },
        typescriptreact = { "prettier_d" },
        css = { "prettier_d" },
        html = { "prettier_d" },
        json = { "prettier_d" },
        yaml = { "prettier_d" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    })
  end,
}
