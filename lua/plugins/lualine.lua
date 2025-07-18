return {
  "nvim-lualine/lualine.nvim",
  vscode = false,
  opts = function()
    local codeCompanion = function()
      local M = require("lualine.component"):extend()

      M.processing = false
      M.spinner_index = 1

      local spinner_symbols = {
        "⠋",
        "⠙",
        "⠹",
        "⠸",
        "⠼",
        "⠴",
        "⠦",
        "⠧",
        "⠇",
        "⠏",
      }
      local spinner_symbols_len = 10

      -- Initializer
      function M:init(options)
        M.super.init(self, options)

        local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})

        vim.api.nvim_create_autocmd({ "User" }, {
          pattern = "CodeCompanionRequest*",
          group = group,
          callback = function(request)
            if request.match == "CodeCompanionRequestStarted" then
              self.processing = true
            elseif request.match == "CodeCompanionRequestFinished" then
              self.processing = false
            end
          end,
        })
      end

      -- Function that runs every time statusline is updated
      function M:update_status()
        if self.processing then
          self.spinner_index = (self.spinner_index % spinner_symbols_len) + 1
          return spinner_symbols[self.spinner_index]
        else
          return nil
        end
      end

      return M
    end

    vim.g.gitblame_display_virtual_text = 0
    local git_blame = require("gitblame")

    local opts = {
      options = {
        theme = "eldritch",
        component_separators = "",
        section_separators = { left = "", right = "" },
        icons_enabled = true,
        globalstatus = true,
        refresh = { statusline = 1000, tabline = 1000 },
        disabled_filetypes = { statusline = { "dashboard" }, tabline = { "dashboard" } },
      },
      extensions = { "neo-tree", "lazy" },
      sections = {
        lualine_a = { { "mode", separator = { left = "", right = "" } } },
        lualine_b = { "branch" },
        lualine_c = {
          { "filename", file_status = true, newfile_status = true, path = 0, shorting_target = 40 },
          { "diff", symbols = { added = " ", modified = "󰣕 ", removed = " " } },
          "diagnostics",
        },
        lualine_x = {
          {
            require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
            color = { fg = "#ff9e64" },
          },
          {
            git_blame.get_current_blame_text,
            cond = git_blame.is_blame_text_available,
          },
          {
            "overseer",
          },
          { codeCompanion() },
          {
            "copilot",
            show_loading = true,
            show_colors = true,
            padding = { right = 1, left = 1 },
            symbols = {
              status = {
                icons = {
                  enabled = " ",
                  sleep = " 󰒲",
                  disabled = " ",
                  warning = " ",
                  unknown = " ",
                },
                hl = {
                  sleep = "#04d1f9",
                },
              },
            },
          },
        },
        lualine_y = {
          "filetype",
          { "location" },
        },
        lualine_z = {
          {
            function()
              local lazyStatus = require("lazy.status")
              local has_updates = lazyStatus.has_updates
              local packages = require("lazy.status").updates
              if has_updates() then
                return "󱧕 " .. packages
              else
                return "󰏗 󰄵"
              end
            end,
          },
        },
      },
    }

    return opts
  end,
  dependencies = { "nvim-tree/nvim-web-devicons", "eldritch-theme/eldritch.nvim" },
}
