local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- { "html", "cssls", "tsserver", "clangd", "pyright", "prismals", "tailwindcss" }
local servers = {}

capabilities.offsetEncoding = { "utf-16" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
