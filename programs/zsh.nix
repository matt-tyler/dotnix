{ pkgs }:
{
  enable = true;
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" ];
    theme = "robbyrussell";
  };
  shellAliases = {
    vi = "nvim";
    vim = "nvim";
  };
  initContent = ''
    # Auto-attach to tmux session 'main' when opening a new terminal
    # Only attach if:
    #   - tmux is available
    #   - not already in a tmux session
    #   - this is an interactive shell
    if command -v tmux &> /dev/null && [ -z "$TMUX" ] && [[ $- == *i* ]]; then
      tmux new-session -A -s main
    fi
  '';
}
