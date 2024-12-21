{ pkgs, lib, ... }:
let mypkgs = import ../packages/default.nix { inherit pkgs lib; };
in {
  home.packages = with pkgs; [
    tmux
    alacritty
    oh-my-zsh
    zsh
    git
    gh
    gnugrep
    ripgrep
    fd
    jq
    yq-go
    # nerdfonts
    direnv
    colima
    docker
    docker-compose
    yubikey-manager

    go_1_23
    gopls
    delve
    golangci-lint

    # Required for mason lsp
    nodejs_20

    wireguard-go

    rustc
    cargo

    tailwindcss

    # rust debugging
    # vscode-extensions.vadimcn.vscode-lldb
  ] ++ (with mypkgs; [
    # gopls_1_23
  ])
    ++ (with pkgs; [] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts));
}
