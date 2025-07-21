return {
  --  _     ____  ____
  -- | |   / ___||  _ \
  -- | |   \___ \| |_) |
  -- | |___ ___) |  __/
  -- |_____|____/|_|
  --
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.keymap.set("n", "<space>cd", vim.diagnostic.open_float)
      vim.keymap.set("n", "[e", function()
        vim.diagnostic.jump({ count = -1, float = true, severity = vim.diagnostic.severity.ERROR })
      end)
      vim.keymap.set("n", "]e", function()
        vim.diagnostic.jump({ count = 1, float = true, severity = vim.diagnostic.severity.ERROR })
      end)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Buffer local mappings.
          local opts = { buffer = ev.buf }
          vim.keymap.set(
            "n",
            "gD",
            vim.lsp.buf.declaration,
            vim.tbl_extend("force", opts, { desc = "Goto declaration" })
          )
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Goto definition" }))
          vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover" }))
          vim.keymap.set(
            "n",
            "gi",
            vim.lsp.buf.implementation,
            vim.tbl_extend("force", opts, { desc = "Implementation" })
          )
          vim.keymap.set(
            { "n", "v" },
            "<space>ca",
            vim.lsp.buf.code_action,
            vim.tbl_extend("force", opts, { desc = "Code action" })
          )
          vim.keymap.set("n", "<space>cf", function()
            vim.lsp.buf.format({ async = true })
          end, vim.tbl_extend("force", opts, { desc = "Format buffer" }))
        end,
      })
    end,
  },
  --  __  __
  -- |  \/  | __ _ ___  ___  _ __
  -- | |\/| |/ _` / __|/ _ \| '_ \
  -- | |  | | (_| \__ \ (_) | | | |
  -- |_|  |_|\__,_|___/\___/|_| |_|
  --
  {
    "mason-org/mason.nvim",
    dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    config = function()
      local mason = require("mason")
      local tool = require("mason-tool-installer")

      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      tool.setup({
        ensure_installed = {
          -- Linters
          "pylint",
          "eslint_d",
          "luacheck",
          -- Formatters
          "stylua",
          "isort",
          "black",
          "prettierd",
        },
      })
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_enable = true,
      ensure_installed = {
        "gopls",
        "lua_ls",
        "basedpyright",
        "rust_analyzer",
        "yamlls",
        "docker_compose_language_service",
        "dockerls",
        "vtsls",
      },
    },
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
  },

  --  ____  _                             _   _
  -- |  _ \(_) __ _  __ _ _ __   ___  ___| |_(_) ___ ___
  -- | | | | |/ _` |/ _` | '_ \ / _ \/ __| __| |/ __/ __|
  -- | |_| | | (_| | (_| | | | | (_) \__ \ |_| | (__\__ \
  -- |____/|_|\__,_|\__, |_| |_|\___/|___/\__|_|\___|___/
  --                |___/
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  --  _                    ____
  -- | |    __ _ _____   _|  _ \  _____   __
  -- | |   / _` |_  / | | | | | |/ _ \ \ / /
  -- | |__| (_| |/ /| |_| | |_| |  __/\ V /
  -- |_____\__,_/___|\__, |____/ \___| \_/
  --                 |___/
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
