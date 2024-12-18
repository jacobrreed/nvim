return {
  "knubie/vim-kitty-navigator",
  vscode = false,
  enabled = function()
    if os.getenv("TERM") == "xterm-kitty" then
      return true
    end
  end,
  build = {
    "cp ./*.py ~/.config/kitty/",
  },
}
