local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({ buffier = bufnr })
end)

local lspconfig = require('lspconfig')

-- C/C++
lspconfig.clangd.setup({})

-- Go
lspconfig.gopls.setup({})

 -- Lua
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          'vim',
        },
      },
    },
  },
})

-- Ruby
lspconfig.rubocop.setup({})
lspconfig.solargraph.setup({})

-- TypeScript
lspconfig.eslint.setup({})
lspconfig.tsserver.setup({})
