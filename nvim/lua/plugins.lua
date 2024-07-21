-- vim-plug@
local Plug = vim.fn['plug#']

vim.call('plug#begin','~/.config/nvim/plugged')

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

Plug('nvim-tree/nvim-web-devicons')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')

Plug('tpope/vim-fugitive')
Plug('tpope/vim-surround')
Plug('tpope/vim-repeat')
Plug('tpope/vim-commentary')

Plug('stevearc/oil.nvim')

vim.call('plug#end')
-- @vim-plug

-- fzf configuration
vim.env.FZF_DEFAULT_COMMAND = 'rg --files'
vim.cmd('command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {\'options\': \'--delimiter : --nth 4..\'}, <bang>0)')

-- netrw configuration
vim.g['netrw_liststyle'] = 3
vim.g['netrw_list_hide'] = '.*\\.swp$,.DS_Store,*/tmp/*,*.swp,*.zip,^\\.git/$'

-- create filetype_ops autogroup
local ft_ops = vim.api.nvim_create_augroup("filetype_ops",{clear = true})
-- highlight Jenkinsfile with groovy syntax
vim.api.nvim_create_autocmd({"BufNewFile","BufRead"},{
  group = ft_ops,
  pattern = {"Jenkinsfile"},
  command = "setf groovy",})
-- vim-commentary for assembly file
vim.api.nvim_create_autocmd({"FileType"},{
  group = ft_ops,
  pattern = {"S","s","asm"},
  command = "setlocal commentstring=#\\ %s",})
-- disable automatic comment insertion
vim.api.nvim_create_autocmd({"FileType"}, {
  group = ft_ops,
  pattern = {"*"},
  command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",})

-- for oil.nvim --
require("oil").setup({
   default_file_explorer = true,
   columns = {
    "icon",
    -- "permissions",
    -- "size",
    -- "mtime",
  },
})
