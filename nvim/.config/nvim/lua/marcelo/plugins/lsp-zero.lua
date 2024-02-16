-- https://github.com/VonHeikemen/lsp-zero.nvim
return {
  {
    'williamboman/mason.nvim',
    opts = {},
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        -- C/C++
        'clangd',
        -- Go
        'gopls',
        -- Lua
        'lua_ls',
        -- Ruby
        'rubocop',
        'solargraph',
        -- TypeScript
        'eslint',
        'tsserver',
      },
    },
  },
  { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },
  { 'L3MON4D3/LuaSnip' },
}
