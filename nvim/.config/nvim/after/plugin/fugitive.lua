vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
vim.keymap.set('n', '<leader>gd', vim.cmd.Gdiffsplit)
vim.keymap.set('n', '<leader>gl', function() vim.cmd 'Git log' end)
vim.keymap.set('n', '<leader>gc', function() vim.cmd 'Git commit' end)
