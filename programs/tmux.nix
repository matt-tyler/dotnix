{ pkgs }:
{
  enable = true;
  prefix = "C-s";
  terminal = "screen-256color";

  plugins = with pkgs.tmuxPlugins; [
    # vim-tmux-navigator
    resurrect
    continuum
  ];

  extraConfig = builtins.readFile ./tmux/tmux.conf;
}
