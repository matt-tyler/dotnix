require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { 
        "gopls",
        "golangci_lint_ls",

        "astro",
        "eslint",
        "tsserver",
        "tailwindcss",

        "remark_ls",

        "terraformls",
        "yamlls",
        "jsonls",

        "pyright",

        "rust_analyzer",

	    "elixirls",
    },
}
