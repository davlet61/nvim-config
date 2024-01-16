local utils = require("utils")
local map = vim.keymap.set

-- Navigate vim panes better
map("n", "<c-k>", ":wincmd k<CR>")
map("n", "<c-j>", ":wincmd j<CR>")
map("n", "<c-h>", ":wincmd h<CR>")
map("n", "<c-l>", ":wincmd l<CR>")

map("n", "<leader>h", ":nohlsearch<CR>")
vim.wo.number = true

-- System clipboard
map("n", "y", '"+y')
map("n", "yy", '"+yy')
map("n", "Y", '"+Y')
map("x", "y", '"+y')
map("x", "Y", '"+Y')
map("n", "p", '"+p')
map("n", "P", '"+P')
map("x", "p", '"+p')
map("x", "P", '"+P')
map("n", "d", '"+d')
map("n", "dd", '"+dd')
map("n", "D", '"+D')
map("x", "d", '"+d')
map("x", "D", '"+D')

-- Navigation
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Toggleterm navigate
function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	map("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Standard operations
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>confirm q<cr>", { desc = "Quit" })
map("v", "<Tab>", ">gv", { desc = "Indent line" })
map("v", "<S-Tab>", "<gv", { desc = "Unindent line" })

map("n", "<leader>c", function()
	utils.close()
end, { desc = "Close Buffer" })

-- Spectre
map("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
	desc = "Toggle Spectre",
})
map("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word",
})
map("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word",
})
map("n", "<leader>sf", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
	desc = "Search on current file",
})
