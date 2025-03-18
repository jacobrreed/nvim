return {
  "declancm/git-scripts.nvim",
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/vault/*.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/vault/*.md",
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    default_keymaps = false,
    commit_on_save = true,
  },
  config = function(_, opts)
    local gitscripts = require("git-scripts")
    gitscripts.setup(opts)

    vim.api.nvim_create_autocmd({ "BufEnter", "VimEnter" }, {
      callback = function()
        gitscripts.async_pull()
      end,
      desc = "Auto pull repo on enter",
    })
  end,
}
