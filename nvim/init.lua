-- basics
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
vim.api.nvim_set_hl(0, 'Comment', { ctermfg = 'green' })
vim.api.nvim_set_hl(0, 'LineNr', { ctermfg = 'grey' })
vim.api.nvim_set_hl(0, 'Pmenu', { ctermfg = 'grey', ctermbg = 'black' })
vim.api.nvim_set_hl(0, 'Pmenusel', { ctermfg = 'black', ctermbg = 'grey' })
vim.api.nvim_set_hl(0, 'TelescopeNormal', { ctermbg = 'black' })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { ctermfg = 'red' })
vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { ctermfg = 'green' })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { ctermfg = 'black', ctermbg = 'white'})
vim.api.nvim_set_hl(0, 'TelescopeMultiSelection', { ctermfg = 'black', ctermbg = 'white'})
vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { ctermfg = 'black', ctermbg = 'white' })
vim.api.nvim_set_hl(0, 'ExtraWhitespace', { ctermbg = 'red' })

-- vim-plug plugins
require('plugins')

-- import lsp configuration
require('lsp_config')

-- import telescope configuration
require('telescope_config')

-- keybindings
require('keybindings')
