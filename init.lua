-- Set <space> as the leader key
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--  ___                            _
-- |_ _|_ __ ___  _ __   ___  _ __| |_ ___
--  | || '_ ` _ \| '_ \ / _ \| '__| __/ __|
--  | || | | | | | |_) | (_) | |  | |_\__ \
-- |___|_| |_| |_| .__/ \___/|_|   \__|___/
--               |_|
require("opts")
require("keymaps")
require("autocmds")

--  _
-- | |    __ _ _____   _
-- | |   / _` |_  / | | |
-- | |__| (_| |/ /| |_| |
-- |_____\__,_/___|\__, |
--                 |___/
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins" },
}, {
  checker = { enabled = true, concurrency = 1 },
  change_detection = { enabled = true, notify = false },
  ui = {
    size = { width = 0.8, height = 0.8 },
    border = "rounded",
    backdrop = 0,
    title = "Lazy",
    title_pos = "left",
  },
  git = {
    log = { "-1" },
  },
  rocks = {
    enabled = true,
    hererocks = nil,
  },
  install = {
    missing = true,
    colorscheme = { "eldritch" },
  },
})

vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { silent = true })
