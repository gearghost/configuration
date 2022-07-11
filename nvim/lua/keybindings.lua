-- key shortcut
vim.g.mapleader= ','

vim.keymap.set('v','J',':m \'>+1<CR>gv=gv')
vim.keymap.set('v','K',':m \'<-2<CR>gv=gv')

local tsc = require('telescope.builtin')

vim.keymap.set('n','<C-p>',function ()
  tsc.find_files()
end)
vim.keymap.set('n','<Leader>b',function ()
  tsc.buffers()
end)
vim.keymap.set('n','<Leader>f',function ()
  tsc.live_grep()
end)
vim.keymap.set('n','<Leader>c',function ()
  tsc.git_commits()
end)
vim.keymap.set('n','<Leader>h',function ()
  tsc.oldfiles()
end)
vim.keymap.set('n','<Leader>t',function ()
  tsc.treesitter()
end)
vim.keymap.set('n','<Leader>?',function ()
  tsc.help_tags()
end)
