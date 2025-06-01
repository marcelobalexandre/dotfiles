return {
  "olimorris/codecompanion.nvim",
  keys = {
    { "<leader>ca", "<cmd>CodeCompanionAction<cr>", desc = "CodeCompanion Action" },
    { "<leader>cc", "<cmd>CodeCompanionChat<cr>", desc = "CodeCompanion Chat" },
  },
  opts = {
    strategies = {
      chat = {
        adapter = {
          name = "copilot",
          model = "claude-sonnet-4",
        },
      },
    },
    display = {
      chat = {
        window = {
          position = "right",
        },
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
