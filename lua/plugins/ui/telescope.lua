return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          layout_strategy = "vertical",
          layout_config = { prompt_position = "top", width = 0.9, height = 0.9 },
          sorting_strategy = "ascending",
          winblend = 0,
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
      })
      telescope.load_extension("fzf")
    end,
    keys = {
      { "<leader>tf", "<cmd>Telescope find_files theme=dropdown<cr>", desc = "Find files" },
      { "<leader><leader>", "<cmd>Telescope find_files theme=dropdown<cr>", desc = "Find files" },
      { "<leader>tb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
      { "<leader>t/", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>tg", "<cmd>Telescope git_files<cr>", desc = "Git file list" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command history" },
      { "<leader>t:", "<cmd>Telescope command_history<cr>", desc = "Command history" },
      { "<leader>?", "<cmd>Telescope search_history<cr>", desc = "Search history" },
      { "<leader>t?", "<cmd>Telescope search_history<cr>", desc = "Search history" },
      { "<leader>tq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix list" },
      { "<leader>tR", "<cmd>Telescope registers<cr>", desc = "Registers" },
      { "<leader>tr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
    },
  },
}
