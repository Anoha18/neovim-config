local status, lspconfig = pcall(require, "lspconfig")
if (not status) then
  print("Lspconfig not found")
  return
end

lspconfig.tsserver.setup {
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server.cmd", "--stdio" },
  root_dir = function() return vim.loop.cwd() end,
}

lspconfig.volar.setup {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
  cmd = { "vue-language-server.cmd", "--stdio" }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.cssls.setup {
  capabilities = capabilities,
  cmd = { "vscode-css-language-server.cmd", "--stdio" }
}
