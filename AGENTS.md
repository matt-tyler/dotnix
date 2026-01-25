# Agent Guidelines for dotnix Repository

This document provides guidelines for AI coding agents working in this Nix-based development environment configuration repository.

## Project Overview

This is a **NixOS/nix-darwin flake** that manages:
- System configurations for macOS (darwin) hosts
- Home Manager configurations
- Development environment setup (Neovim, tmux, zsh, Alacritty)
- Package installations and custom builds

**Primary Language:** Nix expression language (.nix files) with embedded Lua for Neovim configuration

## Build, Test, and Deploy Commands

### Building the System Configuration
```bash
# Build for the 'mini' host (aarch64-darwin)
nix build .#darwinConfigurations.mini.system

# Build for the 'AU-L-0300' host
nix build .#darwinConfigurations.AU-L-0300.system
```

### Applying Configuration Changes
```bash
# Apply system configuration (requires sudo)
sudo ./result/sw/bin/darwin-rebuild switch --flake .

# Alternative: Direct rebuild without building first
darwin-rebuild switch --flake .#mini
darwin-rebuild switch --flake .#AU-L-0300
```

### Testing Configuration
```bash
# Check flake for errors
nix flake check

# Show flake outputs
nix flake show

# Verify flake.lock is up to date
nix flake metadata
```

### Updating Dependencies
```bash
# Update all flake inputs
nix flake update

# Update specific input
nix flake lock --update-input nixpkgs
nix flake lock --update-input home-manager
```

### Development
```bash
# Enter development shell with all dependencies
nix develop

# Format Nix files (if formatter configured)
nix fmt
```

## Code Style Guidelines

### Nix File Conventions

#### File Structure
- Use `{ pkgs, lib, ... }:` parameter pattern for module files
- Import custom packages with: `let mypkgs = import ../packages/default.nix { inherit pkgs lib; };`
- Organize imports at the top: `imports = [ ./packages.nix ];`

#### Formatting
- Use **2-space indentation** (consistent across all .nix files)
- Opening braces on same line: `{ pkgs, ... }:`
- Closing braces aligned with opening statement
- Use semicolons after attribute set definitions
- Prefer multi-line lists for readability when >3 items

#### Naming Conventions
- Files: Use **kebab-case** (e.g., `neovim.nix`, `tmux.nix`)
- Attributes: Use **camelCase** (e.g., `darwinConfigurations`, `home-manager`)
- Package names: Follow nixpkgs conventions (lowercase with hyphens)
- Custom packages: Use descriptive names with version suffixes (e.g., `gopls_1_23`)

#### Attribute Sets
```nix
# Preferred style
{
  enable = true;
  setting = value;
}

# Use 'with' sparingly and only for well-known sets
home.packages = with pkgs; [
  package1
  package2
];
```

#### Imports and Modules
- Use relative paths for local imports: `./hosts/mini/config.nix`
- Import functions return attribute sets: `programs.neovim = import ../programs/neovim.nix { inherit pkgs; };`
- Pass necessary attributes explicitly

### Lua File Conventions (Neovim Config)

#### Formatting
- Use **2-space indentation**
- Single quotes for strings unless interpolation needed
- Function definitions: `local function_name = function() ... end`

#### Structure
- Global settings at top (`vim.opt`, `vim.g`)
- Keymaps after settings (`vim.keymap.set`)
- Plugin setup calls last (`require('plugin').setup {}`)

#### Naming
- Local variables: **snake_case** (e.g., `custom_format`, `common_on_attach`)
- Functions: **snake_case** (e.g., `call_all`, `go_attach`)

#### LSP Configuration Pattern
```lua
vim.lsp.config('server_name', {
  capabilities = capabilities,
  on_attach = common_on_attach,
  settings = { ... },
})

vim.lsp.enable('server_name')
```

## Common Patterns

### Adding a New Package
1. Edit `hosts/packages.nix`
2. Add to `home.packages = with pkgs; [ ... ];`
3. Rebuild and switch configuration

### Creating a Custom Package
1. Define in `packages/default.nix` as attribute in returned set
2. Import in `hosts/packages.nix`: `let mypkgs = import ../packages/default.nix { inherit pkgs lib; };`
3. Add to packages list: `++ (with mypkgs; [ package_name ])`

### Adding a Neovim Plugin
1. Add plugin to `programs/neovim.nix` plugins list
2. If config needed, create/update corresponding Lua file in `programs/nvim/`
3. Use pattern:
```nix
{
  plugin = plugin-name;
  type = "lua";
  config = builtins.readFile ./nvim/config-file.lua;
}
```

### Configuring a New Program
1. Create `programs/program-name.nix`
2. Export configuration as function: `{ pkgs }: { enable = true; ... }`
3. Import in `hosts/home.nix`: `programs.name = import ../programs/name.nix { inherit pkgs; };`

## Error Handling

### Common Issues
- **Hash mismatch**: Update hash in `fetchFromGitHub` calls when source changes
- **Infinite recursion**: Check for circular imports or `with` statements
- **Attribute not found**: Verify package exists in nixpkgs or is properly imported
- **Build failures**: Check `nix build` output for specific errors

### Debugging
```bash
# Verbose build output
nix build --print-build-logs

# Evaluate expression
nix eval .#darwinConfigurations.mini.system

# Show trace on errors
nix build --show-trace
```

## Host-Specific Configurations

- **mini**: Personal machine (user: `matt.tyler`)
- **AU-L-0300**: Work machine (user: `matthewtyler`)

When making changes, consider whether they should be:
- In `hosts/home.nix` (shared across all hosts)
- In `hosts/{hostname}/config.nix` (host-specific system config)
- In `hosts/{hostname}/home.nix` (host-specific home-manager config)

## Important Notes

- This repository uses **flakes** - do not modify without maintaining flake structure
- Changes require rebuild and switch to take effect
- Test configurations in VM or non-critical machine first
- Keep `flake.lock` committed for reproducibility
- Use `inherit` to pass attributes when appropriate: `{ inherit pkgs lib; }`
- The `allowUnfree` configuration enables specific unfree packages (terraform, cockroachdb-bin)

## Version Information

- Nix flake using nixpkgs-25.05-darwin and nixpkgs-unstable
- home-manager follows nixpkgs-unstable
- nix-darwin for macOS system management
- State version: 23.11 (home-manager), 5 (darwin)

## Language Support Matrix

This environment provides comprehensive LSP, formatting, and debugging support for multiple languages. The table below shows the current status for each language.

| Language | LSP Server | Formatter | Linter | Debugger (DAP) | Status | Config Location |
|----------|-----------|-----------|--------|----------------|--------|-----------------|
| **Go** | gopls, golangci_lint_ls | gofumpt (via gopls) | golangci-lint | delve (dap-go) | Full | programs/nvim/lsp.lua:130-151 |
| **Python** | pyright | black, isort | flake8 | None | Full | programs/nvim/lsp.lua:153-157, 240-248 |
| **Nix** | nixd | nixfmt-rfc-style | - | - | Full | programs/nvim/lsp.lua:207-218 |
| **Markdown** | marksman | - | - | - | Full | programs/nvim/lsp.lua:220-225 |
| **Elixir** | elixirls | - | - | - | Full | programs/nvim/lsp.lua:170-182 |
| **TypeScript/JS** | ts_ls | - | - | - | Basic | programs/nvim/lsp.lua:162 |
| **Astro** | astro | - | - | - | Basic | programs/nvim/lsp.lua:164-169 |
| **HTML/HTMX/Templ** | htmx, templ, html | templ fmt (custom) | - | - | Partial | programs/nvim/lsp.lua:39-53, 184-191 |
| **TailwindCSS** | tailwindcss | - | - | - | Partial | programs/nvim/lsp.lua:193-198 |
| **Zig** | zls | - | - | - | Basic | programs/nvim/lsp.lua:160 |
| **Rust** | - | - | - | - | None (commented) | programs/nvim/lsp.lua:259-288 |

### Status Definitions

- **Full**: LSP + formatting/linting + debugging (where applicable)
- **Partial**: LSP configured with some additional tools
- **Basic**: LSP only, minimal configuration
- **None**: Not configured or commented out

### Notes

1. **Go**: Most comprehensive setup with multiple LSPs, formatting, linting, and debugging
2. **Python**: Full stack with pyright LSP, black/isort formatting, and flake8 linting via null-ls
3. **Nix**: Complete LSP with nixd and nixfmt-rfc-style formatter (added to system packages)
4. **Rust**: Configuration exists but is commented out (lines 273-295 in lsp.lua)
   - Requires: rust-tools plugin, mason-registry, and codelldb debugger adapter
   - rustc and cargo are installed in packages but rust-analyzer is not configured
5. **Templ**: Custom formatter function handles `templ fmt` command execution
6. **LSP Structure**: All LSP configuration is in a single file (`programs/nvim/lsp.lua`) organized into logical sections with comments for easy navigation
7. **DAP Keybindings**: Debugging keys (F5, F8-F10, \b, etc.) are available for all languages but only Go has a configured adapter

### Package Installation

Language server binaries and tools are installed via:
- `hosts/packages.nix` - System-wide packages (Go, Python, Nix tools, rustc/cargo, nodejs)
- Mason (Neovim plugin) - Some LSP servers managed by Mason
- nixpkgs - Primary source for most language tooling
