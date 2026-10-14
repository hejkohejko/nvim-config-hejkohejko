--for more info on how setting keymaps works in neovim, consult the internet

vim.keymap.set({'n', 'i', 'x', 's'}, '<C-s>', "<cmd>w<cr><esc>", {}) --save
vim.keymap.set('i', '<C-d>', "<esc>cc", {}) --delete a line while in i I guess
vim.keymap.set({'i','v','n'}, '<C-z>', "<cmd>undo<cr>", {}) --undo
vim.keymap.set({'i','v','n'}, '<C-y>', "<cmd>redo<cr>", {}) --redo
vim.keymap.set('n', 'CA', vim.lsp.buf.code_action, {}) --code actions
vim.keymap.set('n', 'Ca', vim.lsp.buf.code_action, {}) --code actions

--colorscheme setup

vim.o.background = "dark"
vim.cmd.colorscheme "gruvbox"
