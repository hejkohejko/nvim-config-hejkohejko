vim.cmd("set expandtab") --custom tab width
vim.cmd("set tabstop=3")
vim.cmd("set softtabstop=3")
vim.cmd("set shiftwidth=3")

vim.cmd("set number") --shows the number of the line

require("config.lazy")
require("config.settings")

vim.cmd("Neotree") --opens the neotree on boot, delete to disable

