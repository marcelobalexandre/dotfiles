-- https://github.com/tpope/vim-fugitive
return {
  "tpope/vim-fugitive",
  keys = {
    { "<leader>gs", ":Git<CR>" },
    { "<leader>gd", ":Gdiffsplit<CR>" },
    { "<leader>gl", ":Git log<CR>" },
    -- Open commit with last commit message
    { "<leader>gc", ":Git commit -c HEAD <CR>" },
  },
}
