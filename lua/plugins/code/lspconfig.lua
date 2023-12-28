return {
  {
    "neovim/nvim-lspconfig",
    cond = not vim.g.vscode,
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp", cond = not vim.g.vscode },
      { "antosha417/nvim-lsp-file-operations", config = true, cond = not vim.g.vscode },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local keymap = vim.keymap
      local wk = require("which-key")

      local opts = { noremap = true, silent = true }
      local on_attach = function(_, bufnr)
        opts.buffer = bufnr

        wk.register({
          ["L"] = { name = "LSP" },
        }, { mode = "n" }, { prefix = "<leader>" })
      end

      local capabilities = cmp_nvim_lsp.default_capabilities()

      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- JSON
      lspconfig["jsonls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure html server
      lspconfig["html"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig["gopls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- Disable this because we are using typescript-tools plugin
      -- configure typescript server with plugin
      -- lspconfig["tsserver"].setup({
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      -- })

      -- configure css server
      lspconfig["cssls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- Emmet abbreviations
      lspconfig["emmet_ls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
      })

      -- configure python server
      lspconfig["pyright"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure lua server (with special settings)
      lspconfig["lua_ls"].setup({
        settings = {
          Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              -- make language server aware of runtime files
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })
    end,
    keys = {
      { "<leader>Lr", ":LspRestart<CR>", desc = "Restart LSP" },
      { "gR", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "Show references" },
      { "<leader>Ld", "<cmd>Telescope lsp_definitions<CR>", desc = "Show LSP definitions" },
      { "<leader>LI", "<cmd>Telescope lsp_implementations<CR>", desc = "Show LSP implementations" },
      { "<leader>Lt", "<cmd>Telescope lsp_type_definitions<CR>", desc = "Show LSP type definitions" },
      {
        "<leader>cA",
        function()
          vim.lsp.buf.code_action({ context = { only = { "source" }, diagnostics = {} } })
        end,
        desc = "Code action (source)",
      },
      { "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
      { "<leader>D", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Show buffer diagnostics" },
      { "<leader>d", vim.diagnostic.open_float, desc = "Show line diagnostics" },
      { "[d", vim.diagnostic.goto_prev, desc = "Go to previous diagnostic" },
      { "]d", vim.diagnostic.goto_next, desc = "Go to next diagnostic" },
      { "<leader>Li", "<cmd>LspInfo<cr>", desc = "LSP Info" },
      -- opts.desc = "Show documentation for what is under cursor"
      -- keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
    },
  },
  {
    "nvimdev/lspsaga.nvim",
    cond = not vim.g.vscode,
    event = { "LspAttach" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      local lspsaga = require("lspsaga")
      lspsaga.setup({
        lightbulb = {
          enable = false,
          sign = false,
          virtual_text = false,
          enable_in_insert = false,
        },
        symbol_in_winbar = {
          hide_keyword = true,
          folder_level = 0,
        },
      })
    end,
    keys = {
      { "gd", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek definition" },
      { "gD", "<cmd>Lspsaga goto_definition<cr>", desc = "Go to definition" },
      { "gt", "<cmd>Lspsaga peek_type_definition<cr>", desc = "Peek type definition" },
      { "gT", "<cmd>Lspsaga goto_type_definition<cr>", desc = "Go to type definition" },
      { "<leader>Lli", "<cmd>Lspsaga incoming_calls<cr>", desc = "Incoming calls" },
      { "<leader>Llo", "<cmd>Lspsaga outgoing_calls<cr>", desc = "Outgoing calls" },
      { "<leader>Lld", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Diagnostic jump next" },
      { "<leader>Llf", "<cmd>Lspsaga finder<cr>", desc = "Finder" },
      { "<leader>ca", "<cmd>Lspsaga code_action<cr>", desc = "Code action" },
      { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover doc" },
      -- {
      --   "<leader>cA",
      --   function()
      --     require("lspsaga.codeaction").code_action({ context = { only = "source" } })
      --   end,
      --   desc = "Code action (source)",
      -- },
    },
  },
  {
    "pmizio/typescript-tools.nvim",
    cond = not vim.g.vscode,
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        expose_as_code_action = { "fix_all", "add_missing_imports", "remove_unused", "remove_unused_imports" },
      },
    },
  },
}
