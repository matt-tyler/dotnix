{ pkgs, ... }:
{
  home.packages = with pkgs; [
    tmux
    alacritty
    oh-my-zsh
    zsh
    git
    gh
    gnugrep
    kubectl
    jdk
    ripgrep
    fd
    jq
    yq-go
    nerdfonts
    direnv
    colima
    docker
    docker-compose
    yubikey-manager

    # go
    go_1_22
    delve
    gopls
    golangci-lint

    # Required for mason lsp
    nodejs_20

    (python311.withPackages (p: with p; [
      black
      isort
      flake8
      pip
      poetry-core
    ]))

    wireguard-go

    rustc
    cargo

    tailwindcss

    # rust debugging
    # vscode-extensions.vadimcn.vscode-lldb
  ];
}
