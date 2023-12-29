return {
  "natecraddock/workspaces.nvim",
  opts = {
    hooks = {
      open_pre = {
        "SessionsStop",
        "silent %bdelete!",
      },
      open = {
        function()
          require("sessions").load(nil, { silent = true })
        end,
      },
    },
  },
}
