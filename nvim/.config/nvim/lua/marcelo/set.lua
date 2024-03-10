-- Change leader key to space.
vim.g.mapleader = " "

vim.opt.termguicolors = true

-- Change cursor in insert mode.
--vim.opt.guicursor = ''

-- Enable line numbers.
vim.opt.nu = true
vim.opt.relativenumber = true

-- Identation settings.
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.list = true
vim.opt.listchars:append({ lead = "·", trail = "·", space = "·" })

-- Allow move/copy files in netrw.
vim.g.netrw_keepdir = 0
vim.g.netrw_localcopydircmd = "cp -r"
