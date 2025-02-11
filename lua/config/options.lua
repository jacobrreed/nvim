local opt = vim.opt

opt.autowrite = true -- Enable auto write
opt.autoread = true
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 1 -- Hide * markup for bold and italic
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 3 -- global statusline
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "nv"
opt.mousemoveevent = true
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  -- fold = "⸱",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

opt.autochdir = false
-- opt.statuscolumn = "%s%#AbsoluteColumn#%l%1*│%{v:lnum<line('.')?'-':''}%r "
-- opt.statuscolumn = "%s%#AbsoluteColumn#%l%1*│%r "
opt.relativenumber = true

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
end

-- For speed up, using nvim-ts-context-commentstring
vim.g.skip_ts_context_commentstring_module = true

-- Folding
opt.foldlevel = 99
opt.foldmethod = "indent"

vim.g.markdown_recommended_style = 0

vim.g.qf_is_open = false

vim.g.lazyvim_prettier_needs_config = true
vim.g.lazyvim_eslint_auto_format = true

-- Set wsl-clipboard for vim clipboard if running WSL
-- Check if the current linux kernal is microsoft WSL version
local function is_wsl()
  local version_file = io.open("/proc/version", "rb")
  if version_file ~= nil and string.find(version_file:read("*a"), "microsoft") then
    version_file:close()
    return true
  end
  return false
end
-- More info: https://github.com/memoryInject/wsl-clipboard
if is_wsl() then
  vim.g.clipboard = {
    name = "wsl-clipboard",
    copy = {
      ["+"] = "wcopy",
      ["*"] = "wcopy",
    },
    paste = {
      ["+"] = "wpaste",
      ["*"] = "wpaste",
    },
    cache_enabled = true,
  }
end
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard

-- Set wsl-clipboard for vim clipboard if running WSL
-- Check if the current linux kernal is microsoft WSL version
local function is_wsl()
  local version_file = io.open("/proc/version", "rb")
  if version_file ~= nil and string.find(version_file:read("*a"), "microsoft") then
    version_file:close()
    return true
  end
  return false
end

-- If current linux is under WSL then use wclip.
