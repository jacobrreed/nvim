return {
  "stevearc/conform.nvim",
  cond = not vim.g.vscode,
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local conform = require("conform")

    vim.api.nvim_create_user_command("FormatToggle", function(args)
      if args.bang then
        -- FormatToggle! will disable formatting just for this buffer
        if vim.b.disable_autoformat then
          vim.b.disable_autoformat = false
          require("notify")("Formatting enabled for buffer")
        else
          vim.b.disable_autoformat = true
          require("notify")("Formatting disabled for buffer")
        end
      else
        if vim.g.disable_autoformat then
          vim.g.disable_autoformat = false
          require("notify")("Formatting enabled")
        else
          vim.g.disable_autoformat = true
          require("notify")("Formatting disabled")
        end
      end
    end, {
      desc = "Toggle autoformat",
      bang = true,
    })

    conform.setup({
      quiet = true,
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt" },
      },
      format_on_save = function()
        if vim.g.disable_autoformat then
          return
        end
        return {
          lsp_fallback = true,
          timeout_ms = 500,
        }
      end,
    })

    vim.keymap.set({ "n", "v" }, "<leader>fv", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })

    vim.keymap.set({ "n" }, "<leader>cft", "<cmd>FormatToggle<cr>", { desc = "Toggle autoformat" })
    vim.keymap.set({ "n" }, "<leader>cfT", "<cmd>FormatToggle!<cr>", { desc = "Toggle autoformat for buffer" })
  end,
}
