-- https://github.com/nvim-treesitter/nvim-treesitter
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "vrischmann/tree-sitter-templ",
  },
  opts = {
    ensure_installed = {
      "c",
      "go",
      "javascript",
      "lua",
      "query",
      "ruby",
      "templ",
      "typescript",
      "vim",
      "vimdoc",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*.templ",
      callback = function()
        vim.cmd("TSBufEnable highlight")
      end,
    })
  end,
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
}
