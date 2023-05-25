require'lspconfig'.clangd.setup{}
require'lspconfig'.gopls.setup{}

local servers = { 'clangd', 'gopls' }

for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    flags = {
      debounce_text_changes = 150,
    }
  }
end
