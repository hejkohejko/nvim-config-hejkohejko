return{
   {
       "mason-org/mason-lspconfig.nvim",
       opts = {},
       dependencies = {
         { "mason-org/mason.nvim", opts = {} },
         "neovim/nvim-lspconfig",
      },
      config = function()
         require("mason-lspconfig").setup {
         ensure_installed = { "lua_ls", "clangd", "bashls", "ts_ls", "html", "cssls", "pylsp"},
         }
      end,
   },
   {
      "neovim/nvim-lspconfig",
      config = function()

         local capabilities = require('cmp_nvim_lsp').default_capabilities()

         --local lspconfig = require("lspconfig")
         --lspconfig.lua_ls.setup({
        --[[vim.lsp.config({
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
         })]]--
        vim.lsp.config("*", {
            capabilities = capabilities
         })
        vim.lsp.config("clangd", {
            capabilities = capabilities
         })
        vim.lsp.config("bashls", {
            capabilities = capabilities
         })
        vim.lsp.config("ts_ls", {
            capabilities = capabilities
         })
        vim.lsp.config("html", {
            capabilities = capabilities
         })         
        vim.lsp.config("cssls", {
            capabilities = capabilities
         })
        vim.lsp.config("pylsp", {
            capabilities = capabilities
         })      

         vim.keymap.set({'n'}, 'I', vim.lsp.buf.hover, {})
      end,
   }
}
