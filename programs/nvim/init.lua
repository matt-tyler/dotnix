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

require('auto-session').setup {}
