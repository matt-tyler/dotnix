
local lspconfig = require('lspconfig')
local util = require('lspconfig/util')

lspconfig.gopls.setup {
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  }

require'lspconfig'.tsserver.setup{}


vim.filetype.add({
  extension = {
    astro = "astro"
  }
})

require'lspconfig'.astro.setup{}