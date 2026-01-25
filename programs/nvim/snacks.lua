-- snacks.nvim configuration
-- Only enabling features used by opencode.nvim:
-- - input: Enhanced input prompts with completion and highlighting
-- - picker: Fuzzy selection with previews
-- - terminal: Terminal provider for opencode

require('snacks').setup({
  -- Disable all features by default
  bigfile = { enabled = false },
  dashboard = { enabled = false },
  dim = { enabled = false },
  git = { enabled = false },
  gitbrowse = { enabled = false },
  indent = { enabled = false },
  lazygit = { enabled = false },
  notifier = { enabled = false },
  notify = { enabled = false },
  profiler = { enabled = false },
  quickfile = { enabled = false },
  rename = { enabled = false },
  scope = { enabled = false },
  scroll = { enabled = false },
  statuscolumn = { enabled = false },
  toggle = { enabled = false },
  win = { enabled = false },
  words = { enabled = false },
  zen = { enabled = false },

  -- Enable only features used by opencode.nvim
  
  -- input: Used by opencode.nvim's ask() function
  -- Provides enhanced input prompts with syntax highlighting and completion
  input = {
    enabled = true,
  },

  -- picker: Used by opencode.nvim's select() function
  -- Provides fuzzy selection with live previews
  picker = {
    enabled = true,
  },

  -- terminal: Used by opencode.nvim's snacks provider
  -- Manages the integrated opencode terminal
  terminal = {
    enabled = true,
  },
})
