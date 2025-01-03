require "nvchad.options"

-----------------------------------
-- Custom neovim options
-----------------------------------

-- local o = vim.o
local opt = vim.opt

-- to enable cursorline!
opt.cursorlineopt='both'

-- file encodings
opt.fileencoding=utf8

-- Set indent options
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Enable filetype detection, plugin, and indent
vim.cmd('filetype plugin indent on')


