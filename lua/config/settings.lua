vim.keymap.set({'n', 'i', 'x', 's'}, '<C-s>', "<cmd>w<cr><esc>", {})
vim.keymap.set('i', '<C-d>', "<esc>cc", {})
vim.keymap.set({'i','v','n'}, '<C-z>', "<cmd>undo<cr>", {})
vim.keymap.set({'i','v','n'}, '<C-y>', "<cmd>redo<cr>", {})
vim.keymap.set('n', 'CA', vim.lsp.buf.code_action, {})
vim.keymap.set('n', 'Ca', vim.lsp.buf.code_action, {})

vim.o.background = "dark"
vim.cmd.colorscheme "gruvbox"
