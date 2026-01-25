require'nvim-treesitter.config'.setup {
  -- ensure_installed = { "lua", "rust", "toml", "go", "python" },
  -- auto_install = true,
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}
