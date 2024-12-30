# Project README

## Overview

This project is a comprehensive configuration setup for a development environment using Nix and Neovim. It includes configurations for various tools and applications such as tmux, zsh, Alacritty, and Neovim, along with specific settings for different hosts.

## File Structure

### Nix Configuration Files

- **flake.nix**: Defines the Nix flake configuration, including inputs and outputs for different systems.
- **flake.lock**: Lock file for the Nix flake, ensuring reproducibility.
- **hosts/home.nix**: Base configuration for the home environment.
- **hosts/packages.nix**: Defines the packages to be installed in the home environment.
- **hosts/AU-L-0300/config.nix**: Configuration specific to the AU-L-0300 host.
- **hosts/AU-L-0300/home.nix**: Home configuration for the AU-L-0300 host.
- **hosts/mini/config.nix**: Configuration specific to the mini host.
- **hosts/mini/home.nix**: Home configuration for the mini host.
- **packages/default.nix**: Defines custom packages, including a specific version of `gopls`.

### Program Configuration Files

- **programs/alacritty.nix**: Configuration for the Alacritty terminal emulator.
- **programs/git.nix**: Configuration for Git, including user details and settings.
- **programs/neovim.nix**: Configuration for Neovim, including plugins and settings.
- **programs/tmux.nix**: Configuration for tmux, including plugins and key bindings.
- **programs/zsh.nix**: Configuration for zsh, including Oh My Zsh and shell aliases.

### Neovim Lua Configuration Files

- **programs/nvim/alpha.lua**: Configuration for the Alpha plugin.
- **programs/nvim/bufferline.lua**: Configuration for the Bufferline plugin.
- **programs/nvim/cmp.lua**: Configuration for the nvim-cmp plugin.
- **programs/nvim/dap.lua**: Configuration for the nvim-dap plugin.
- **programs/nvim/git.lua**: Configuration for the gitsigns plugin.
- **programs/nvim/init.lua**: Main initialization file for Neovim.
- **programs/nvim/leap.lua**: Configuration for the Leap plugin.
- **programs/nvim/lsp.lua**: Configuration for the LSP setup.
- **programs/nvim/lualine.lua**: Configuration for the Lualine plugin.
- **programs/nvim/mason.lua**: Configuration for the Mason plugin.
- **programs/nvim/nightfox.lua**: Configuration for the Nightfox colorscheme.
- **programs/nvim/nvim-tree.lua**: Configuration for the Nvim Tree plugin.
- **programs/nvim/project_nvim.lua**: Configuration for the Project.nvim plugin.
- **programs/nvim/telescope.lua**: Configuration for the Telescope plugin.
- **programs/nvim/treesitter.lua**: Configuration for the Treesitter plugin.
- **programs/nvim/trouble.lua**: Configuration for the Trouble plugin.
- **programs/nvim/web-devicons.lua**: Configuration for the Web Devicons plugin.

### Tmux Configuration Files

- **programs/tmux/tmux.conf**: Main configuration file for tmux.

## Getting Started

To set up this development environment, follow these steps:

1. **Install Nix**: Follow the instructions on the [Nix website](https://nixos.org/download.html) to install Nix.
2. **Clone the Repository**: Clone this repository to your local machine.
3. **Run Nix Flake**: Use the `nix flake` command to build and apply the configuration.

```sh
nix build .#darwinConfigurations.mini.system
sudo ./result/sw/bin/darwin-rebuild switch --flake .
```

4. **Launch Applications**: Open your terminal emulator (Alacritty) and start using the configured tools (Neovim, tmux, zsh).

## Customization

You can customize the configurations by editing the respective files. For example, to add new Neovim plugins, modify `programs/neovim.nix` and the corresponding Lua configuration files.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.


