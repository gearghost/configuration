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

-- highlight Jenkinsfile with groovy syntax
-- vim-commentary for assembly file
-- disable automatic comment insertion
vim.api.nvim_exec(
[[
  autocmd BufNewFile,BufRead Jenkinsfile setf groovy
  autocmd FileType S,s,asm setlocal commentstring=#\ %s
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]],false)

-- vim-plug@
local Plug = vim.fn['plug#']

vim.call('plug#begin','~/.config/nvim/plugged')

Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install()']})
Plug('junegunn/fzf.vim')

-- lsp and code completion
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')

-- using vsnip engine
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')

Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn['TSUpdate']})

Plug('tpope/vim-fugitive')
Plug('tpope/vim-surround')
Plug('tpope/vim-repeat')
Plug('tpope/vim-commentary')

vim.call('plug#end')
-- @vim-plug

-- key shortcut
vim.g.mapleader= ','

vim.keymap.set('n','<Leader>b',':Buffers<CR>')
vim.keymap.set('n','<Leader>f',':Rg<CR>')
vim.keymap.set('n','<Leader>c',':Commits<CR>')
vim.keymap.set('n','<Leader>h',':History<CR>')
vim.keymap.set('n','<Leader>t',':Tags<CR>')
vim.keymap.set('n','<Leader>?',':Helptags<CR>')

vim.keymap.set('n','<C-p>',':Files<CR>')

vim.keymap.set('v','J',':m \'>+1<CR>gv=gv')
vim.keymap.set('v','K',':m \'<-2<CR>gv=gv')

-- fzf configuration
vim.env.FZF_DEFAULT_COMMAND = 'rg --files'
vim.cmd('command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {\'options\': \'--delimiter : --nth 4..\'}, <bang>0)')

-- netrw configuration
vim.g['netrw_liststyle'] = 3
vim.g['netrw_list_hide'] = '.*\\.swp$,.DS_Store,*/tmp/*,*.swp,*.zip,^\\.git/$'

-- import lsp configuration
require 'lsp_config'
