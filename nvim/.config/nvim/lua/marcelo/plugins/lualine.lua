-- https://github.com/nvim-lualine/lualine.nvim
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = 'catppuccin',
      component_separators = { left = '', right = '' },
      section_separators = { left = '█', right = '█' },
      globalstatus = true,
    },
  },
  config = function(_, opts)
    local harpoon = require('harpoon.mark')

    -- Copied from Dillon Mulroy.
    -- https://github.com/dmmulroy/kickstart.nix/blob/main/config/nvim/lua/plugins/lualine.lua
    local function harpoon_component()
      local total_marks = harpoon.get_length()

      if total_marks == 0 then
        return ''
      end

      local current_mark = '—'

      local mark_idx = harpoon.get_current_index()
      if mark_idx ~= nil then
      	current_mark = tostring(mark_idx)
      end

      return string.format('󱡅 %s/%d', current_mark, total_marks)
    end

    require('lualine').setup({
      options = opts.options,
      sections = {
        lualine_b = {
          'branch',
          harpoon_component,
          'diff',
          'diagnostics',
        },
      },
    })
  end
}
