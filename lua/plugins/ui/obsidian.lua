return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/dev/notes/**.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/dev/notes/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/dev/notes/",
      },
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    mappings = {
      ["gd"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },
    picker = {
      name = "telescope.nvim",
      mappings = {
        new = "<C-n>",
        insert_link = "<C-l>",
      },
    },
    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(suffix)
    end,
    image_name_func = function()
      return string.format("%s")
    end,
  },
  keys = {
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New..." },
    { "<leader><leader>", "<cmd>ObsidianQuickSwitch<cr>", desc = "Find..." },
    {
      "<leader>/",
      function()
        local input = vim.fn.input("Search/Create: ")
        vim.cmd("ObsidianSearch " .. input)
      end,
      desc = "Search/Create",
    },
    { "<leader>ov", "<cmd>ObsidianFollowLink vsplit<cr>", desc = "Open link in vsplit" },
    { "<leader>ot", "<cmd>ObsidianTags<cr>", desc = "Tags" },
    { "<leader>ol", "<cmd>ObsidianLinkNew<cr>", desc = "Visual: Link new", mode = "v" },
    { "<leader>oL", "<cmd>ObsidianLinks<cr>", desc = "Links..." },
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Backlinks..." },
    {
      "<leader>op",
      function()
        local input = vim.fn.input("Image Name: ")
        vim.cmd("ObsidianPasteImg " .. input)
      end,
      desc = "Paste Image...",
    },
    { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "Open in Obsidian App..." },
    {
      "<leader>on",
      "<cmd>ObsidianExtractNote<cr>",
      desc = "Visual: Extract to new note",
      mode = "v",
    },
    {
      "<leader>or",
      function()
        local input = vim.fn.input("Rename to: ")
        vim.cmd("ObsidianRename " .. input)
      end,
      desc = "Rename note id: ",
    },
  },
}
