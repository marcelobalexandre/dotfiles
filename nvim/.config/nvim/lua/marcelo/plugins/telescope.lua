-- https://github.com/nvim-telescope/telescope.nvim
return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    defaults = {
      file_ignore_patterns = { '.git/' },
    },
    pickers = {
      live_grep = {
        additional_args = function()
          return { '--hidden' }
        end
      },
    },
  },
}
