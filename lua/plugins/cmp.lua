return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  config = function()
    local cmp = require("cmp")
    local auto_select = true

    local opts = {
      experimental = {
        ghost_text = true,
      },
      completion = {
        completeopt = "menu,menuone,preview,noselect" .. (auto_select and "" or ",noselect"),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<tab>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<S-CR>"] = cmp.mapping.abort(),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "crates" },
        { name = "copilot" },
        { name = "luasnip" },
        { name = "rg", keyword_length = 3 },
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        format = require("lspkind").cmp_format({
          mode = "symbol",
          max_width = 100,
          symbol_map = {
            Copilot = " ",
            crates = " ",
          },
        }),
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
    }

    require("cmp").setup(opts)
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })
  end,
  dependencies = {
    "onsails/lspkind.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "lukas-reineke/cmp-rg",
    "L3MON4D3/LuaSnip",
  },
}
