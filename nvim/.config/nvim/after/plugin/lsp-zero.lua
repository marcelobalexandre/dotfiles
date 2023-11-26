local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffier = bufnr })
end)

local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup({})
lspconfig.ccls.setup{}
lspconfig.tsserver.setup({})
lspconfig.eslint.setup({})
lspconfig.solargraph.setup{}
lspconfig.rubocop.setup{}
