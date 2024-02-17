-- https://github.com/VonHeikemen/lsp-zero.nvim
return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        -- C/C++
        "clangd",
        -- Go
        "gopls",
        -- Lua
        "lua_ls",
        -- Ruby
        "rubocop",
        "solargraph",
        -- TypeScript
        "eslint",
        "tsserver",
      },
    },
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    config = function(_, opts)
      local lsp_zero = require("lsp-zero")
      lsp_zero.setup(opts)

      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({ buffier = bufnr })
      end)

      local lspconfig = require("lspconfig")

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
                "vim",
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
    end,
  },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/nvim-cmp" },
  { "L3MON4D3/LuaSnip" },
}
