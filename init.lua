vim.cmd("set expandtab")
vim.cmd("set tabstop=3")
vim.cmd("set softtabstop=3")
vim.cmd("set shiftwidth=3")

vim.cmd("set number")

require("config.lazy")
require("config.settings")
require("config.startup")

vim.cmd("Neotree")

--[[vim.lsp.config(

         local capabilities = require('cmp_nvim_lsp').default_capabilities()

         local lspconfig = require("lspconfig")
         lspconfig.lua_ls.setup({
            capabilities = capabilities
         })
         lspconfig.clangd.setup({
            capabilities = capabilities
         })
         lspconfig.bashls.setup({
            capabilities = capabilities
         })
         lspconfig.ts_ls.setup({
            capabilities = capabilities
         })
         lspconfig.html.setup({
            capabilities = capabilities
         })
         lspconfig.cssls.setup({
            capabilities = capabilities
         })

         vim.keymap.set({'n'}, 'I', vim.lsp.buf.hover, {})
      )]]--
