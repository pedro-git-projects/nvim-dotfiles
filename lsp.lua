require'lspconfig'.clangd.setup{}

local servers = { 'clangd' }

for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    flags = {
      debounce_text_changes = 150,
    }
  }
end
