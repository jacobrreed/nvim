return {
  "nvim-telescope/telescope.nvim",
  cond = not vim.g.vscode,
  tag = "0.1.5",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "debugloop/telescope-undo.nvim",
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

    local select_one_or_multi = function(prompt_bufnr)
      local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
      local multi = picker:get_multi_selection()
      if not vim.tbl_isempty(multi) then
        require("telescope.actions").close(prompt_bufnr)
        for _, j in pairs(multi) do
          if j.path ~= nil then
            vim.cmd(string.format("%s %s", "edit", j.path))
          end
        end
      else
        require("telescope.actions").select_default(prompt_bufnr)
      end
    end

    telescope.setup({
      pickers = {
        find_files = {
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--no-ignore-vcs",
            "-g",
            "!**/.git/*",
            "-g",
            "!**/node_modules/*",
          },
        },
      },
      defaults = {
        history = {
          path = vim.fn.stdpath("data") .. "/telescope_history.sqlite",
          limit = 100,
        },
        layout_config = { width = 0.99, height = 0.99 },
        sorting_strategy = "ascending",
        winblend = 0,
        color_devicons = true,
        path_display = filenameFirst,
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            ["<C-t>"] = require("trouble.providers.telescope").open_with_trouble,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<RightMouse>"] = actions.close,
            ["<LeftMouse>"] = actions.select_default,
            ["<ScrollWheelDown>"] = actions.move_selection_next,
            ["<ScrollWheelUp>"] = actions.move_selection_previous,
            ["<CR>"] = select_one_or_multi,
          },
        },
        extensions = {
          live_grep_args = {
            auto_quoting = true,
          },
          undo = {
            mappings = {
              ["<cr>"] = require("telescope-undo.actions").restore,
            },
          },
        },
      },
    })
    telescope.load_extension("fzf")
    telescope.load_extension("live_grep_args")
    telescope.load_extension("bookmarks")
    telescope.load_extension("undo")
    telescope.load_extension("aerial")
  end,
  keys = function()
    local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
    return {
      {
        "<leader>tf",
        "<cmd>Telescope find_files<cr>",
        desc = "Find files",
      },
      {
        "<leader><leader>",
        "<cmd>Telescope find_files<cr>",
        desc = "Find files",
      },
      { "<leader>tb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
      { "<leader>t/", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", desc = "Live grep" },
      { "<leader>/", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", desc = "Live grep" },
      {
        "<leader>/",
        live_grep_args_shortcuts.grep_visual_selection,
        mode = "v",
        desc = "Live grep (visual)",
      },
      { "<leader>tg", "<cmd>Telescope git_files<cr>", desc = "Git file list" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command history" },
      { "<leader>t:", "<cmd>Telescope command_history<cr>", desc = "Command history" },
      { "<leader>?", "<cmd>Telescope search_history<cr>", desc = "Search history" },
      { "<leader>t?", "<cmd>Telescope search_history<cr>", desc = "Search history" },
      { "<leader>tC", ":lua require('telescope.builtin').colorscheme()<cr>", desc = "Color schemes" },
      { "<leader>tq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix list" },
      { "<leader>tR", "<cmd>Telescope registers<cr>", desc = "Registers" },
      { "<leader>to", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
      { "<leader>tu", "<cmd>Telescope undo<cr>", desc = "Undo history" },
      { "<leader>tr", "<cmd>Telescope resume<cr>", desc = "Telescope resume" },
      { "<leader>ta", "<cmd>Telescope aerial<cr>", desc = "Telescope Aerial (code outline)" },
    }
  end,
}
