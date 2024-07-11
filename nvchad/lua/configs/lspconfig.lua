local configs = require "nvchad.configs.lspconfig"

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "tailwindcss" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  -- Uncomment below lines to disable formatting by tsserver
  -- on_attach = function(client)
  --   client.server_capabilities.documentFormattingProvider = false
  --   client.server_capabilities.documentRangeFormattingProvider = false
  -- end,
  on_init = on_init,
  capabilities = capabilities,
}
