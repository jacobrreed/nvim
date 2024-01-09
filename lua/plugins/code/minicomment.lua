return {
  "echasnovski/mini.comment",
  event = "VeryLazy",
  opts = {
    options = {
      custom_commentstring = function()
        return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
      end,
    },
    mappings = {
      -- Toggle comment (like `gcip` - comment inner paragraph) for both
      -- Normal and Visual modes
      comment = "gc",
      -- Toggle comment on current line
      comment_line = "gcc",

      -- Toggle comment on visual selection
      comment_visual = "gc",

      -- Define 'comment' textobject (like `dgc` - delete whole comment block)
      textobject = "gc",
    },
  },
}
