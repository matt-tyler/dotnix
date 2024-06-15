{ pkgs, ... }:
{
  imports = [ ../home.nix ];

  home.packages = with pkgs; [
    flyctl
  ];
  
  programs = {
    git = {
      enable = true;
      userName = "Matt Tyler";
      userEmail = "me@matthewtyler.io";
      extraConfig = {
        credentials.helper = "osxkeychain";
        core = {
          editor = "nvim";
        };
        color = {
          ui = true;
        };
        push = {
          default = "simple";
        };
        pull = {
          ff = "only";
        };
        init = {
          defaultBranch = "main";
        };
      };
      ignores = [
        ".DS_Store"
      ];
    };
  };
} 
