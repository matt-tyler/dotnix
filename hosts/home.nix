{ pkgs, mypkgs, lib, ... }:
let 
  gopls_1_22 = pkgs.buildGo122Module rec {
    pname = "gopls";
    version = "0.15.1";
  
    src = pkgs.fetchFromGitHub {
      owner = "golang";
      repo = "tools";
      rev = "gopls/v${version}";
      hash = "sha256-GJ2zc5OgZXwEq12f0PyvgOOUd7cctUbFvdp095VQb9E=";
    };
  
    modRoot = "gopls";
    vendorHash = "sha256-Xxik0t1BHQPqzrE3Oh3VhODn+IqIVa+TCNqQSnmbBM0=";
  
    doCheck = false;
  
    # Only build gopls, and not the integration tests or documentation generator.
    subPackages = [ "." ];
  
    meta = with lib; {
      description = "Official language server for the Go language";
      homepage = "https://github.com/golang/tools/tree/master/gopls";
      changelog = "https://github.com/golang/tools/releases/tag/${src.rev}";
      license = licenses.bsd3;
      maintainers = with maintainers; [ mic92 rski SuperSandro2000 zimbatm ];
      mainProgram = "gopls";
    };
  };
in
{
  imports = [ ./packages.nix ];

  home.stateVersion = "23.11";

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

  programs.neovim = import ../programs/neovim.nix {
    inherit pkgs;
  };

  programs.starship = {
    enable = true;

    settings = {
      aws = {
        disabled = true;
      };
      battery = {
        disabled = true;
      };
      gcloud = {
        disabled = true;
      };
    };
  };
}
