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
    (google-cloud-sdk.withExtraComponents [google-cloud-sdk.components.gke-gcloud-auth-plugin])
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

    # Required for mason lsp
    nodejs_20

    # python
    python311
 #    (python311.withPackages
 #      [
 #        black
	# isort
	# flake8
	# poetry
	# pip
 #      ]
 #    )

  ];

  home.sessionVariables = {
    EDITOR = "neovim";
  };

  programs.home-manager.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.tmux = import ./programs/tmux.nix {
    inherit pkgs;
  };

  programs.alacritty = import ./programs/alacritty.nix {
    inherit pkgs;
  };

  programs.zsh = import ./programs/zsh.nix {
    inherit pkgs;
  };

  programs.git = import ./programs/git.nix {
    inherit pkgs;
  };

  programs.neovim = import ./programs/neovim.nix {
    inherit pkgs;
  };
}
