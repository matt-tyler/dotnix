{ pkgs, ... }:
{
  home.stateVersion = "23.05";
  home.packages = with pkgs; [
    tmux
    alacritty
    oh-my-zsh
    zsh
    git
    gh
    gnugrep
    flyctl
    kubectl
    azure-cli
    awscli2
    jdk
    (google-cloud-sdk.withExtraComponents [
      #google-cloud-sdk.components.gke-gcloud-auth-plugin 
      #google-cloud-sdk.components.pubsub-emulator
    ])
    terraform
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
    go
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

    # rust debugging
    vscode-extensions.vadimcn.vscode-lldb
  ];

  home.sessionVariables = {
    EDITOR = "neovim";
  };

  programs.home-manager.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.tmux = import ../programs/tmux.nix {
    inherit pkgs;
  };

  programs.alacritty = import ../programs/alacritty.nix {
    inherit pkgs;
  };

  programs.zsh = import ../programs/zsh.nix {
    inherit pkgs;
  };

  # programs.git = import ./programs/git.nix {
  #   inherit pkgs;
  # };

  programs.neovim = import ../programs/neovim.nix {
    inherit pkgs;
  };
}
