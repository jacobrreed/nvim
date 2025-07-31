return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    keys = {
      { "<leader>cp", "<cmd>MarkdownPreview<cr>", desc = "Markdown preview" },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "codecompanion", "Avante", "markdown", "copilot-chat", "rmd", "norg", "org" },
    opts = {
      file_types = { "markdown", "Avante" },
      anti_conceal = {
        enabled = true,
        ignore = {
          code_background = true,
          sign = true,
        },
      },
      completions = { blink = { enabled = true } },
      preset = "obsidian",
      bullet = {
        right_pad = 1,
      },
      checkbox = {
        enabled = true,
        unchecked = { icon = "▢ " },
        checked = { icon = "✓ " },
        custom = { todo = { rendered = "◯ " } },
        right_pad = 1,
      },
    },
  },
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    lazy = true,
    event = "VimEnter",
    cond = function()
      -- Check if the current working directory is within the vault
      local cwd = vim.fn.getcwd()
      local vault_path = vim.fn.expand("~/vault")
      return vim.startswith(cwd, vault_path)
    end,
    config = function(_, opts)
      local wk = require("which-key")
      wk.add({
        { "<leader>o", group = "Obsidian", icon = "" },
      })
      local prefix = "<leader>o"

      local mappings = {
        { prefix .. "o", "<cmd>ObsidianOpen<CR>", desc = "Open on App" },
        { "<leader>sO", "<cmd>ObsidianSearch<CR>", desc = "Obsidian Grep" },
        { prefix .. "n", "<cmd>ObsidianNew<CR>", desc = "New Note" },
        { prefix .. "<space>", "<cmd>ObsidianQuickSwitch<CR>", desc = "Find Files" },
        { prefix .. "b", "<cmd>ObsidianBacklinks<CR>", desc = "Backlinks" },
        { prefix .. "t", "<cmd>ObsidianTags<CR>", desc = "Tags" },
        { prefix .. "T", "<cmd>Obsidian template<CR>", desc = "Template" },
        { prefix .. "l", "<cmd>ObsidianLink<CR>", mode = "v", desc = "Link" },
        { prefix .. "L", "<cmd>ObsidianLinks<CR>", desc = "Links" },
        { prefix .. "N", "<cmd>ObsidianLinkNew<CR>", mode = "v", desc = "New Link" },
        { prefix .. "e", "<cmd>ObsidianExtractNote<CR>", mode = "v", desc = "Extract Note" },
        { prefix .. "w", "<cmd>ObsidianWorkspace<CR>", desc = "Workspace" },
        { prefix .. "r", "<cmd>ObsidianRename<CR>", desc = "Rename" },
        { prefix .. "i", "<cmd>ObsidianPasteImg<CR>", desc = "Paste Image" },
        { prefix .. "d", "<cmd>ObsidianDailies<CR>", desc = "Daily Notes" },
      }

      -- Set up the plugin
      require("obsidian").setup(opts)

      -- Register keymaps
      for _, mapping in ipairs(mappings) do
        local mode = mapping.mode or "n"
        vim.keymap.set(mode, mapping[1], mapping[2], { desc = mapping.desc })
      end
    end,
    opts = {
      ui = {
        enable = false,
        checkboxes = {
          [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
          ["x"] = { char = "", hl_group = "ObsidianDone" },
          ["!"] = { char = "", hl_group = "ObsidianImportant" },
          [">"] = { char = "", hl_group = "ObsidianRightArrow" },
          ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
        },
      },
      workspaces = {
        {
          name = "vault",
          path = vim.fn.expand("~/vault"),
        },
      },
      daily_notes = {
        folder = "Daily Notes",
        date_format = "%d %b %Y",
        template = vim.fn.expand("~/vault/templates/daily-note.md"),
      },
      completion = {
        nvim_cmp = false,
        blink = true,
      },
      mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ["gd"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- Smart action depending on context, either follow link or toggle checkbox.
        ["<cr>"] = {
          action = function()
            return require("obsidian").util.smart_action()
          end,
          opts = { buffer = true, expr = true },
        },
      },
      preferred_link_style = "markdown",
      disable_frontmatter = false,
      templates = {
        folder = "templates",
        date_format = "%d %b %Y",
      },
      follow_url_func = function(url)
        -- Open the URL in the default web browser.
        -- vim.fn.jobstart({ "open", url }) -- Mac OS
        -- vim.fn.jobstart({"xdg-open", url})  -- linux
        -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
        vim.ui.open(url) -- need Neovim 0.10.0+
      end,
      picker = {
        name = "snacks.pick",
        new = "<C-x>",
        -- Insert a link to the selected note.
        insert_link = "<C-l>",
      },
      tag_mappings = {
        -- Add tag(s) to current note.
        tag_note = "<C-x>",
        -- Insert a tag at the current location.
        insert_tag = "<C-l>",
      },
    },
  },
}
