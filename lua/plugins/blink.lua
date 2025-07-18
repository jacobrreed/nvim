return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = {
    "fang2hou/blink-copilot",
  },
  opts = {
    enabled = function()
      return not vim.tbl_contains({ "oil", "markdown" }, vim.bo.filetype) and vim.bo.buftype ~= "prompt"
    end,
    sources = {
      default = { "copilot", "lsp", "lazydev", "path", "snippets", "buffer" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 99,
          async = true,
        },
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
      per_filetype = {
        codecompanion = { "codecompanion" },
      },
    },
    completion = {
      menu = {
        border = "rounded",
        draw = {
          padding = { 0, 1 }, -- padding only on right side
          components = {
            kind_icon = {
              text = function(ctx)
                return " " .. ctx.kind_icon .. ctx.icon_gap .. " "
              end,
            },
          },
        },
      },
      trigger = { prefetch_on_insert = false },
      list = {
        -- selection = "manual",
        selection = {
          preselect = true,
          auto_insert = true,
        },
      },
    },
    keymap = {
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<Tab>"] = { "accept", "fallback" },
      ["<C-l>"] = { "scroll_documentation_up", "fallback" },
      ["<C-h>"] = { "scroll_documentation_down", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "snippet_forward", "fallback" },
      ["<C-Tab>"] = { "snippet_backward", "fallback" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    },
  },
}
