return {
  "iamcco/markdown-preview.nvim",
  init = function()
    vim.g.mkdp_preview_options = { disable_sync_scroll = 1 }
  end,
}
