-- https://github.com/nvim-telescope/telescope.nvim
return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    defaults = {
      file_ignore_patterns = { ".git/" },
    },
    pickers = {
      live_grep = {
        additional_args = function()
          return { "--hidden" }
        end,
      },
    },
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>" },
    { "<C-p>", "<cmd>Telescope git_files<CR>" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>" },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("fzf")
  end,
}
