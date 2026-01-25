# Hotkey Reference Guide

This document provides a comprehensive reference for all configured keyboard shortcuts in tmux and Neovim.

**Current Configuration:**
- **Tmux Prefix:** `Ctrl-s`
- **Neovim Leader:** `\`

---

## Tmux Keybindings

### Prefix Key: `Ctrl-s`

| Shortcut | Description |
|----------|-------------|
| `Ctrl-s` + `r` | Reload tmux configuration |
| `Ctrl-s` + `-` | Split window vertically (current path) |
| `Ctrl-s` + `\` | Split window horizontally (current path) |
| `Ctrl-s` + `c` | Create new window (current path) |
| `Ctrl-s` + `b` | Break pane into new window |
| `Ctrl-s` + `Ctrl-j` | Choose tree (window/session selector) |

### Navigation (No Prefix)

| Shortcut | Description |
|----------|-------------|
| `Ctrl-h` | Navigate to left pane (vim-aware) |
| `Ctrl-j` | Navigate to pane below (vim-aware) |
| `Ctrl-k` | Navigate to pane above (vim-aware) |
| `Ctrl-l` | Navigate to right pane (vim-aware) |
| `Ctrl-\` | Navigate to last pane (vim-aware) |
| `Ctrl-Space` | Cycle through panes (vim-aware) |

### Pane Resizing (No Prefix)

| Shortcut | Description |
|----------|-------------|
| `Shift-Left` | Resize pane left (2 cells) |
| `Shift-Right` | Resize pane right (2 cells) |
| `Shift-Down` | Resize pane down (1 cell) |
| `Shift-Up` | Resize pane up (1 cell) |
| `Ctrl-Left` | Resize pane left (10 cells) |
| `Ctrl-Right` | Resize pane right (10 cells) |
| `Ctrl-Down` | Resize pane down (5 cells) |
| `Ctrl-Up` | Resize pane up (5 cells) |

### Copy Mode (Vi-style)

| Shortcut | Description |
|----------|-------------|
| `v` | Begin selection |
| `y` | Copy selection to clipboard |
| `Enter` | Copy selection to clipboard |
| `Ctrl-h/j/k/l` | Navigate in copy mode |

---

## Neovim Keybindings

### Leader Key: `\`

> **Note:** The leader key is `\` (backslash). In the tables below, `<leader>` represents this key.

### General Editor

| Shortcut (Generic) | Shortcut (Actual) | Description |
|-------------------|------------------|-------------|
| `<leader>e` | `\ e` | Toggle NvimTree file explorer |

### Telescope (Fuzzy Finder)

| Shortcut (Generic) | Shortcut (Actual) | Description |
|-------------------|------------------|-------------|
| `<leader>f` | `\ f` | Find files |
| `<leader>g` | `\ g` | Git status |
| `<leader>G` | `\ G` | Git commits |
| `<leader>q` | `\ q` | Quickfix list |
| `<leader>?` | `\ ?` | Live grep (search in files) |
| `<leader>!` | `\ !` | Commands palette |
| `<leader>/` | `\ /` | Current buffer fuzzy find |
| `<leader><leader>` | `\ \` | Buffer list |
| `<leader>w` | `\ w` | Treesitter symbols |

### LSP (Language Server Protocol) - All Languages

These keybindings work in any buffer with an active LSP server.

| Shortcut (Generic) | Shortcut (Actual) | Description |
|-------------------|------------------|-------------|
| `K` | `K` | Hover documentation |
| `gd` | `gd` | Go to definition |
| `gr` | `gr` | Find references |
| `gi` | `gi` | Go to implementation |
| `gt` | `gt` | Go to type definition |
| `<leader>r` | `\ r` | Rename symbol |
| `<leader>ca` | `\ c a` | Code action |
| `<leader>F` | `\ F` | Format document |

### Diagnostics

| Shortcut (Generic) | Shortcut (Actual) | Description |
|-------------------|------------------|-------------|
| `<leader>dk` | `\ d k` | Go to next diagnostic |
| `<leader>dj` | `\ d j` | Go to next diagnostic |
| `<leader>dl` | `\ d l` | List all diagnostics (Telescope) |

### Debugging (DAP)

| Shortcut (Generic) | Shortcut (Actual) | Description |
|-------------------|------------------|-------------|
| `F5` | `F5` | Continue/Start debugging |
| `F8` | `F8` | Step over |
| `F9` | `F9` | Step into |
| `F10` | `F10` | Step out |
| `<leader>b` | `\ b` | Toggle breakpoint |
| `<leader>B` | `\ B` | Set conditional breakpoint |
| `<leader>lp` | `\ l p` | Set log point |
| `<leader>dr` | `\ d r` | Open debug REPL |

---

## Language-Specific Keybindings

### Go

All general LSP keybindings apply, plus:

| Shortcut (Generic) | Shortcut (Actual) | Description |
|-------------------|------------------|-------------|
| `<leader>dt` | `\ d t` | Debug current test |

**LSP Servers:** gopls, golangci_lint_ls

### Python

All general LSP keybindings apply.

**LSP Server:** pyright  
**Formatters:** black, isort  
**Linter:** flake8

### Elixir

All general LSP keybindings apply, plus:

| Shortcut (Generic) | Shortcut (Actual) | Description |
|-------------------|------------------|-------------|
| `<leader>i` | `\ i` | View docs for symbol |

**LSP Server:** elixirls (v0.15.1)

### TypeScript/JavaScript

All general LSP keybindings apply.

**LSP Server:** ts_ls

### Nix

All general LSP keybindings apply.

**LSP Server:** nixd  
**Formatter:** nixfmt

### Zig

All general LSP keybindings apply.

**LSP Server:** zls

### HTML/HTMX/Templ

All general LSP keybindings apply.

**LSP Servers:** htmx, templ, html

### TailwindCSS

All general LSP keybindings apply.

**LSP Server:** tailwindcss  
**Filetypes:** templ, astro, javascript, typescript, react

### Astro

All general LSP keybindings apply.

**LSP Server:** astro

### Markdown

All general LSP keybindings apply.

**LSP Server:** marksman  
**Filetypes:** markdown, md

---

## Notes

- **Vim-Tmux Integration:** The `Ctrl-h/j/k/l` navigation keys work seamlessly between Neovim and tmux panes.
- **Mouse Support:** Tmux has mouse support enabled for pane selection and resizing.
- **Session Management:** Tmux is configured with auto-session restore via continuum and resurrect plugins.
- **Copy to Clipboard:** Tmux copy mode uses `pbcopy` for macOS clipboard integration.

---

## Neovim Session Management

Neovim uses the `auto-session` plugin for automatic session management. Sessions are automatically saved and restored based on the current working directory.

### Auto-Session Features

- **Automatic Save/Restore:** Sessions are automatically saved when exiting Neovim and restored when opening in the same directory
- **Session Lens:** Built-in session picker with telescope integration
- **Directory-Based:** Each directory gets its own session, preserving buffer layout, window splits, and working state

### Session Management (No keybindings configured)

To manually manage sessions, use these commands:

| Command | Description |
|---------|-------------|
| `:SessionSave` | Manually save current session |
| `:SessionRestore` | Restore session for current directory |
| `:SessionDelete` | Delete session for current directory |
| `:SessionSearch` | Opens telescope picker to search/select sessions |
| `:SessionDisableAutoSave` | Disable auto-saving for current session |

### Notes

- Sessions are stored in `~/.local/share/nvim/sessions/`
- The plugin automatically cleans up invalid sessions
- Buffer types in `buftypes_to_ignore` are not saved (currently empty list)
