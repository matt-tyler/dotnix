-- Set leader key explicitly (must be set before any keymaps)
vim.g.mapleader = "\\"

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

-- Search behavior
vim.opt.ignorecase = true  -- Case-insensitive search by default
vim.opt.smartcase = true   -- Case-sensitive if search contains uppercase
vim.opt.hlsearch = true    -- Highlight search results
vim.opt.incsearch = true   -- Incremental search (show matches as you type)

-- Tmux/Neovim integration: auto-reload files changed outside Neovim
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "checktime",
  pattern = "*",
})

vim.filetype.add({ extension = { templ = "templ" } })

vim.cmd [[autocmd FileType markdown set tw=80 wrap]]


vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- opencode.nvim keybindings
-- Using Ctrl-a and Ctrl-x for opencode (original increment/decrement remapped to +/-)
vim.keymap.set({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode…" })
vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end, { desc = "Execute opencode action…" })
vim.keymap.set({ "n", "t" }, "<C-.>", function() require("opencode").toggle() end, { desc = "Toggle opencode" })

-- Operator mode for adding ranges/lines to opencode
vim.keymap.set({ "n", "x" }, "go",  function() return require("opencode").operator("@this ") end, { desc = "Add range to opencode", expr = true })
vim.keymap.set("n",          "goo", function() return require("opencode").operator("@this ") .. "_" end, { desc = "Add line to opencode", expr = true })

-- Scroll opencode window
vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end, { desc = "Scroll opencode up" })
vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "Scroll opencode down" })

-- Remap default increment/decrement (displaced by opencode bindings above)
vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })

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

