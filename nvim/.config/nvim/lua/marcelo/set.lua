vim.opt.guicursor = ''

vim.opt.nu = true
vim.opt.relativenumber = true
--vim.o.statuscolumn = '%s%l %r '

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

vim.opt.updatetime = 50

vim.opt.colorcolumn = '80'

vim.g.mapleader = ' '

vim.opt.list = true
vim.opt.listchars:append({ lead = '·',  trail = '·', space = '·' })

-- Allow move/copy files in netrw
vim.g.netrw_keepdir = 1
