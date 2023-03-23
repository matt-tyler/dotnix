{ pkgs }:
{
  enable = true;

  settings = {
    env = {
      TERM = "xterm-256color";
    };
    shell = {
      program = "zsh";
      args = [ "-l" "-c" "tmux" "new-session" "-A" "-s" "main" ];
    };
    font = {
      size = 14;

      normal.family = "SauceCodePro Nerd Font";
      bold.family = "SauceCodePro Nerd Font";
      italic.family = "SauceCodePro Nerd Font";
    };
  };
}