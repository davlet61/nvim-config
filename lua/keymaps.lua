-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

-- System clipboard
vim.keymap.set('n','y','"+y')
vim.keymap.set('n','yy','"+yy')
vim.keymap.set('n','Y','"+Y')
vim.keymap.set('x','y','"+y')
vim.keymap.set('x','Y','"+Y')
vim.keymap.set('n', 'p', '"+p')
vim.keymap.set('n', 'P', '"+P')
vim.keymap.set('x', 'p', '"+p')
vim.keymap.set('x', 'P', '"+P')
vim.keymap.set('n', 'd', '"+d')
vim.keymap.set('n', 'dd', '"+dd')
vim.keymap.set('n', 'D', '"+D')
vim.keymap.set('x', 'd', '"+d')
vim.keymap.set('x', 'D', '"+D')


-- Navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Toggleterm navigate
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


-- Standard operations
vim.keymap.set('n', '<leader>w', "<cmd>w<cr>", { desc = "Save" })
vim.keymap.set('n', '<leader>q', "<cmd>confirm q<cr>", { desc = "Quit" })
vim.keymap.set('v', '<Tab>', ">gv", { desc = "Indent line" })
vim.keymap.set('v', '<S-Tab>', "<gv", { desc = "Unindent line" })


