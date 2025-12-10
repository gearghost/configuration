-- key shortcut
vim.g.mapleader= ','

vim.keymap.set('n','<Leader>r',':copen<Enter>')
vim.keymap.set('n','<Leader>x',':cclose<Enter>')
vim.keymap.set('v','J',':m \'>+1<CR>gv=gv')
vim.keymap.set('v','K',':m \'<-2<CR>gv=gv')
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<Leader>f", "<CMD>Oil --float<CR>", { desc = "Open float parent directory" })

local tsc = require('telescope.builtin')

vim.keymap.set('n','<C-p>',function ()
  tsc.find_files()
end)
vim.keymap.set('n','<Leader>b',function ()
  tsc.buffers()
end)
vim.keymap.set('n','<Leader>g',function ()
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

-- Toggle paste mode with F2 key
vim.api.nvim_set_keymap('n', '<F2>', ':set paste!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<F2>', '<Esc>:set paste!<CR>i', { noremap = true, silent = true })

-- Optional: Display a notification when paste mode is active
vim.api.nvim_create_autocmd('OptionSet', {
  pattern = 'paste',
  callback = function()
    if vim.opt.paste:get() then
      vim.notify('PASTE mode active', vim.log.levels.INFO, {})
    else
      vim.notify('PASTE mode disabled', vim.log.levels.INFO, {})
    end
  end
})
