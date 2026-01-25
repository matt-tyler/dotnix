{ pkgs, ... }:
{
  imports = [ ../home.nix ];
  home.packages = with pkgs; [
    flyctl
    tailscale
  ];

  xdg.configFile."ghostty/config".source = ./xdg/ghostty/config;

  programs = {
    git = import ../../programs/git.nix {
      userName = "Matt Tyler";
      userEmail = "me@matthewtyler.io";
    };
  };
} 
