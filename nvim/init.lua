-- basics
vim.opt.pastetoggle = '<F11>'
vim.opt.errorbells = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.ttimeout = true -- time out for key codes
vim.opt.ttimeoutlen = 10 -- wait up to 10ms after Esc for special key
vim.opt.termguicolors = false -- disable true code support within neovim

-- highlights
vim.api.nvim_exec(
[[
  highlight Comment ctermfg=green guifg=green
  highlight LineNr ctermfg=grey guifg=grey
  highlight Pmenu ctermfg=black ctermbg=white guifg=black guibg=white
  highlight Pmenusel ctermfg=green ctermbg=blue guifg=green guibg=blue
]],false)

-- vim-plug plugins
require 'plugins'

-- import lsp configuration
require 'lsp_config'

-- keybindings
require 'keybindings'
