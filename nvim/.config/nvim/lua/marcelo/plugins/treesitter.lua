-- https://github.com/nvim-treesitter/nvim-treesitter
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "c",
      "go",
      "javascript",
      "lua",
      "query",
      "ruby",
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
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
}
