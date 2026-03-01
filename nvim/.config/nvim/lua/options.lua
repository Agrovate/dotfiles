vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.winborder = "rounded"
vim.opt.smartindent = true
vim.opt.guicursor = ""
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.wrap = false
vim.opt.undodir = vim.fn.expand("~/.local/share/nvim/undo")
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.packpath:prepend(vim.fn.stdpath('data') .. '/site')
