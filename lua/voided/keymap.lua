vim.g.maplocalleader = " "
vim.g.mapleader = " "

local map = vim.keymap.set

-- go back to file exploration
map("n", "<leader>ll", vim.cmd.Ex)
map("n", "<leader>ls", ":Lex 20<CR>")

-- move code
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==')
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==')
vim.keymap.set('n', '<A-h>',  '<<')
vim.keymap.set('n', '<A-l>',  '>>')

vim.keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi')
vim.keymap.set('i', '<A-h>',  '<C-d>')
vim.keymap.set('i', '<A-l>',  '<C-t>')

vim.keymap.set('v', '<A-j>', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', '<A-k>', ':m \'<-2<CR>gv=gv')
vim.keymap.set('v', '<A-h>', '<gv')
vim.keymap.set('v', '<A-l>', '>gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- newline in normal mode
vim.keymap.set('n', '<Leader>o', 'o')
vim.keymap.set('n', '<Leader>O', 'O')
vim.keymap.set('n', 'o', 'o<Esc>')
vim.keymap.set('n', 'O', 'O<Esc>')

-- break line
vim.keymap.set('n', '<A-S-j>', 'i<CR><ESC>')

-- delete without yank

vim.keymap.set('x', 'p', 'pgvy') -- yanks back what has been pasted
vim.keymap.set('n', '<leader>C', '"_C') -- change to end of line without yanking
vim.keymap.set('n', '<leader>S', '"_S') -- substitude to end of line without yanking
vim.keymap.set('n', '<leader>x', '"_x') -- delete character without yanking
vim.keymap.set('n', '<leader>dd', '"_dd') -- delete line without yanking
vim.keymap.set('n', '<leader>d', '"_d') -- delete without yanking     (you have that one)
vim.keymap.set('n', '<leader>D', '"_D') -- delete to end of line without yanking
vim.keymap.set('v', '<leader>d', '"_d') -- delete selection without yanking  

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

-- move to window
vim.cmd(
  [[
  function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
      if (match(a:key,'[jk]'))
        wincmd v
      else
        wincmd s
      endif
      exec "wincmd ".a:key
    endif
  endfunction
  ]]
)

vim.keymap.set('n', '<leader>h', ":call WinMove('h')<CR>")
vim.keymap.set('n', '<leader>j', ":call WinMove('j')<CR>")
vim.keymap.set('n', '<leader>k', ":call WinMove('k')<CR>")
vim.keymap.set('n', '<leader>l', ":call WinMove('l')<CR>")

