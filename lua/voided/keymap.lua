vim.g.maplocalleader = " "
vim.g.mapleader = " "

local map = vim.keymap.set

-- go back to file exploration
map("n", "<leader>ll", vim.cmd.Explore)
map("n", "<leader>ls", ":NvimTreeToggle<CR>")

-- move code
map('n', '<A-j>', ':m .+1<CR>==')
map('n', '<A-k>', ':m .-2<CR>==')
map('n', '<A-h>',  '<<')
map('n', '<A-l>',  '>>')

map('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi')
map('i', '<A-h>',  '<C-d>')
map('i', '<A-l>',  '<C-t>')

map('v', '<A-j>', ':m \'>+1<CR>gv=gv')
map('v', '<A-k>', ':m \'<-2<CR>gv=gv')
map('v', '<A-h>', '<gv')
map('v', '<A-l>', '>gv')
map('v', '>', '>gv')
map('v', '<', '<gv')

-- newline in normal mode
map('n', '<Leader>o', 'o')
map('n', '<Leader>O', 'O')
map('n', 'o', 'o<Esc>')
map('n', 'O', 'O<Esc>')

-- break line
map('n', '<A-S-j>', 'i<CR><ESC>')

-- delete without yank

map('x', 'p', 'pgvy') -- yanks back what has been pasted
map('n', '<leader>C', '"_C') -- change to end of line without yanking
map('n', '<leader>S', '"_S') -- substitude to end of line without yanking
map('n', '<leader>x', '"_x') -- delete character without yanking
map('n', '<leader>dd', '"_dd') -- delete line without yanking
map('n', '<leader>d', '"_d') -- delete without yanking     (you have that one)
map('n', '<leader>D', '"_D') -- delete to end of line without yanking
map('v', '<leader>d', '"_d') -- delete selection without yanking  

-- Resize with arrows
-- delta: 2 lines
map('n', '<C-Up>', ':resize +2<CR>')
map('n', '<C-Down>', ':resize -2<CR>')
map('n', '<C-Left>', ':vertical resize -2<CR>')
map('n', '<C-Right>', ':vertical resize +2<CR>')

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

map('n', '<leader>h', ":call WinMove('h')<CR>")
map('n', '<leader>j', ":call WinMove('j')<CR>")
map('n', '<leader>k', ":call WinMove('k')<CR>")
map('n', '<leader>l', ":call WinMove('l')<CR>")

