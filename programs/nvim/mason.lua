require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { 
        "gopls",

        "astro",
        "eslint",
        "tsserver",
        "tailwindcss",

        "remark_ls",

        "terraformls",
        "yamlls",
        "jsonls",
    },
}
