-- https://github.com/VonHeikemen/lsp-zero.nvim

-- Reference: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/lazy-loading-with-lazy-nvim.md

-- Debug reference: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/what-to-do-when-lsp-doesnt-start.md

local function get_formatter_for(ft)
  if ft == "javascript" or ft == "typescript" then
    local biome_exists = #vim.fs.find("biome.json", { upward = true }) > 0
    return biome_exists and { "biome" } or { "eslint" }
  end
  return nil
end

return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually.
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = true,
  },
  -- Formatter
  -- https://github.com/stevearc/conform.nvim
  {
    "stevearc/conform.nvim",
    opts = {
      --log_level = vim.log.levels.DEBUG,
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2" },
        },
        rubocop = {
          -- args = { "-a", "-f", "quiet", "--stderr", "--stdin", "$FILENAME" },
          args = { "--server", "--auto-correct-all", "--stderr", "--force-exclusion", "--stdin", "$FILENAME" },
        },
        htmlbeautifier = {
          args = { "--keep_blank_lines", "1" },
        },
      },
      formatters_by_ft = {
        go = { "goimports", "gofumpt", "golines" },
        lua = { "stylua" },
        sh = { "shellcheck", "shfmt" },
        ruby = { "rubocop" },
        eruby = { "htmlbeautifier" },
        javascript = get_formatter_for("javascript"),
        typescript = get_formatter_for("typescript"),
        svelte = { "prettier", "prettierd", stop_after_first = true },
      },
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        return { timeout_ms = 1000, lsp_fallback = true }
      end,
    },
    config = function(_, opts)
      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          -- FormatDisable! will disable formatting just for this buffer.
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = "Disable autoformat-on-save",
        bang = true,
      })

      vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = "Re-enable autoformat-on-save",
      })

      require("conform").setup(opts)
    end,
  },
  -- https://github.com/zapling/mason-conform.nvim
  {
    "zapling/mason-conform.nvim",
  },
  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "L3MON4D3/LuaSnip" },
    },
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_cmp()

      local cmp = require("cmp")
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup({
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-f>"] = cmp_action.luasnip_jump_forward(),
          ["<C-b>"] = cmp_action.luasnip_jump_backward(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer", max_item_count = 5 },
          { name = "copilot" },
          { name = "path", max_item_count = 3 },
          { name = "luasnip", max_item_count = 3 },
        }),
      })
    end,
  },
  -- LSP
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })

        vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
      end)

      require("mason-lspconfig").setup({
        ensure_installed = {
          -- C/C++
          "clangd",
          -- Go
          "gopls",
          "templ",
          -- Lua
          "lua_ls",
          -- Shell
          "bashls",
          -- Svelte
          "svelte",
          -- TypeScript
          "biome",
          "eslint",
          "ts_ls",
          -- Tailwind CSS
          -- "tailwindcss",
        },
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
          end,
          -- tailwindcss = function()
          --   require("lspconfig").tailwindcss.setup({
          --     settings = {
          --       tailwindCSS = {
          --         includeLanguages = {
          --           eruby = "erb",
          --         },
          --         experimental = {
          --           classRegex = {
          --             "\\bclass:\\s*'([^']*)'",
          --             '\\bclass:\\s*"([^"]*)"',
          --           },
          --         },
          --       },
          --     },
          --   })
          -- end,
          biome = function()
            require("lspconfig").biome.setup({})
          end,
        },
      })

      require("mason-conform").setup({
        ignore_install = { "rubocop" },
      })

      -- Skip mason-lspconfig for ruby_lsp to to use the version installed via mise-managed Ruby.
      require("lspconfig").ruby_lsp.setup({})

      -- Skip mason-lspconfig for tailwindcss to use the version installed via mise-managed Node.
      require("lspconfig").tailwindcss.setup({
        root_dir = require("lspconfig.util").root_pattern(
          "tailwind.config.js",
          "tailwind.config.cjs",
          "tailwind.config.ts",
          "tailwind.config.rb",
          "config/tailwind.config.js"
        ),
        settings = {
          tailwindCSS = {
            includeLanguages = {
              eruby = "erb",
            },
            experimental = {
              classRegex = {
                "\\bclass:\\s*'([^']*)'",
                '\\bclass:\\s*"([^"]*)"',
              },
            },
          },
        },
      })
    end,
  },
}
