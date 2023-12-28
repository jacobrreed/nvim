return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  options = {
    theme = "dracula-nvim",
    icons_enabled = true,
    globalstatus = true,
    disabled_filetypes = { statusline = { "dashboard" } },
    extensions = { "neo-tree", "lazy" },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      -- TODO add copilot and defualts here
    },
  },
  config = function(_, opts)
    require("lualine").setup(opts)
  end,
  dependencies = { "nvim-tree/nvim-web-devicons", "Mofiqul/dracula.nvim" },
}
