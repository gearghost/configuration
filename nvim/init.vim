syntax on
set number
set t_Co=256
set showmode
set showcmd
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set showmatch
set ruler
set noerrorbells
set encoding=utf-8
set pastetoggle=<F11>
set smartindent
set smartcase
set nowrap
set incsearch
set ai
set hlsearch
set ttimeout        " time out for key codes
set ttimeoutlen=10 " wait up to 0ms after Esc for special key
set relativenumber
"set termguicolors "enable true code support within neovim

highlight Comment ctermfg=green guifg=green
highlight LineNr ctermfg=grey guifg=grey
highlight Pmenu ctermfg=black ctermbg=white guifg=black guibg=white
highlight PmenuSel ctermfg=green ctermbg=blue guifg=green guibg=blue

set nocompatible
filetype off

call plug#begin ('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" lsp and code completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" using vsnip engine
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'

call plug#end()

filetype plugin indent on

" key shortcut
let mapleader = ','

nnoremap <leader>b :Buffers<CR>

nnoremap <leader>f :Rg<CR>

nnoremap <leader>c :Commits<CR>

nnoremap <leader>h :History<CR>

nnoremap <leader>t :Tags<CR>

nnoremap <leader>? :Helptags<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" fzf configuration
nnoremap <C-p> :Files<CR>
let $FZF_DEFAULT_COMMAND = 'rg --files'
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" netrw configuration
let g:netrw_liststyle = 3
let g:netrw_list_hide= '.*\.swp$,.DS_Store,*/tmp/*,*.swp,*.zip,^\.git/$'

" highlight Jenkinsfile with groovy syntax
au BufNewFile,BufRead Jenkinsfile setf groovy

" vim-commentary for assembly file
autocmd FileType S,s,asm setlocal commentstring=#\ %s

" disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

lua << EOF

require 'lsp'

EOF
