return {
  "ibhagwan/fzf-lua",
  opts = {
    fzf_opts = { ["--wrap"] = true },
    -- Transparent
    fzf_colors = {
      true,
      bg = "-1",
      gutter = "-1",
    },
    winopts = {
      width = 0.9,
      height = 0.9,
      border = "rounded",
      preview = {
        horizontal = "right:50%",
        title = true,
      },
      number = false,
      relativenumber = false,
    },
    files = {
      formatter = "path.filename_first",
    },
  },
}
