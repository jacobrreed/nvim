return {
  "nvim-neo-tree/neo-tree.nvim",
  cond = not vim.g.vscode,
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
  },
  keys = {
    { "<leader>f", "<cmd>Neotree toggle<cr>", desc = "NeoTree toggle" },
  },
  config = function()
    vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
    require("neo-tree").setup({
      close_if_last_window = false,
      buffers = {
        follow_current_file = {
          leave_dirs_open = true,
        },
      },
      event_handlers = {
        -- {
        --   event = "file_opened",
        --   handler = function(_)
        --     require("neo-tree.command").execute({ action = "close" })
        --   end,
        -- },
        {
          event = "file_added",
          handler = function(destination)
            local manager = require("neo-tree.sources.manager")
            local utils = require("neo-tree.utils")
            local uv = vim.loop
            local file_info = uv.fs_stat(destination)
            if file_info and file_info.type == "file" then
              vim.schedule(function()
                utils.open_file(manager.get_state_for_window(), destination)
              end)
            end
          end,
        },
      },
      filesystem = {
        commands = {
          system_open = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            local isMac = vim.fn.has("macunix")
            if isMac then
              vim.fn.jobstart({ "open", path }, { detach = true })
            else
              vim.fn.jobstart({ "xdg-open", path }, { detach = true })
            end
          end,
          diff_files = function(state)
            local node = state.tree:get_node()
            local log = require("neo-tree.log")
            state.clipboard = state.clipboard or {}
            if diff_Node and diff_Node ~= tostring(node.id) then
              local current_Diff = node.id
              require("neo-tree.utils").open_file(state, diff_Node, open)
              vim.cmd("vert diffs " .. current_Diff)
              log.info("Diffing " .. diff_Name .. " against " .. node.name)
              diff_Node = nil
              current_Diff = nil
              state.clipboard = {}
              require("neo-tree.ui.renderer").redraw(state)
            else
              local existing = state.clipboard[node.id]
              if existing and existing.action == "diff" then
                state.clipboard[node.id] = nil
                diff_Node = nil
                require("neo-tree.ui.renderer").redraw(state)
              else
                state.clipboard[node.id] = { action = "diff", node = node }
                diff_Name = state.clipboard[node.id].node.name
                diff_Node = tostring(state.clipboard[node.id].node.id)
                log.info("Diff source file " .. diff_Name)
                require("neo-tree.ui.renderer").redraw(state)
              end
            end
          end,
        },
        window = {
          mappings = {
            ["o"] = "system_open",
            ["D"] = "diff_files",
          },
        },
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = true,
          always_show = {
            "**/logs/**",
            "dist",
            ".gitignore",
            ".node-version",
            ".pretterrc",
          },
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
      },
    })
  end,
}
