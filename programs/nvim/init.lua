vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr"
vim.opt.foldlevel = 99
vim.opt.colorcolumn = "80,120"
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.showcmd = true

vim.filetype.add({ extension = { templ = "templ" } })

vim.cmd [[autocmd FileType markdown set tw=80 wrap]]


vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

require('guess-indent').setup {}

require('auto-session').setup {
  session_lens = {
    -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
    buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
    load_on_setup = true,
    theme_conf = { border = true },
    previewer = false,
  },
}

-- require('session-lens').setup {}

-- require("telescope").load_extension("session-lens")

