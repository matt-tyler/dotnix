{ pkgs, ... }:
{
  imports = [ ../home.nix ];
  programs = {
    git = {
      enable = true;
      userName = "Matt Tyler";
      userEmail = "matt.tyler@qoria.com";
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
