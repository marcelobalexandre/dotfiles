return {
  {
    "zbirenbaum/copilot.lua",
    event = { "BufEnter" },
    opts = {
      filetypes = {
        gitcommit = true,
        markdown = true,
        yaml = true,
      },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    event = { "BufEnter" },
    dependencies = { "zbirenbaum/copilot.lua" },
    opts = {},
  },
}
