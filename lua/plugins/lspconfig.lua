return {
  "neovim/nvim-lspconfig",
  vscode = false,
  opts = {
    servers = { eslint = {
      settings = {
        workingDirectory = { mode = "auto" },
      },
    } },
    inlay_hints = {
      enabled = false,
    },
    setup = {
      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
        vim.cmd([[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll]])
      end,
    },
  },
}
