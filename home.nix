{ pkgs, ... }:
{
  home.stateVersion = "22.05";
  home.packages = with pkgs; [
    tmux
    neovim
    alacritty
    oh-my-zsh
    zsh
    git
    gh
  ];

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };

  programs.git = {
    userName = "Matt Tyler";
    userEmail = "me@matthewtyler.io";
  };
}
