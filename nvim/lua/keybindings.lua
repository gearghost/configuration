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
