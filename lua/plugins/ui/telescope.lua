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

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "TelescopeResults",
        callback = function(ctx)
          vim.api.nvim_buf_call(ctx.buf, function()
            vim.fn.matchadd("TelescopeParent", "\t\t.*$")
            vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
          end)
        end,
      })

      local function filenameFirst(_, path)
        local tail = vim.fs.basename(path)
        local parent = vim.fs.dirname(path)
        if parent == "." then
          return tail
        end
        return string.format("%s\t\t%s", tail, parent)
      end

      telescope.setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top", width = 0.9, height = 0.9 },
          sorting_strategy = "ascending",
          winblend = 0,
          color_devicons = true,
          path_display = filenameFirst,
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
          extensions = {
            live_grep_args = {
              auto_quoting = true,
            },
          },
        },
      })
      telescope.load_extension("fzf")
      telescope.load_extension("live_grep_args")
    end,
    keys = {
      { "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader><leader>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>tb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
      { "<leader>t/", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", desc = "Live grep" },
      { "<leader>/", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", desc = "Live grep" },
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
