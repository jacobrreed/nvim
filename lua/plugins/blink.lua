return {
  "saghen/blink.cmp",
  opts = {
    enabled = function()
      return not vim.tbl_contains({ "copilot-chat" }, vim.bo.filetype) and vim.bo.buftype ~= "prompt"
    end,
    sources = {
      per_filetype = {
        codecompanion = { "codecompanion" },
      },
    },
    completion = {
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
