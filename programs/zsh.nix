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
  initExtra = ''
    # Interactive tmux session attachment for Ghostty
    # Only run in new Ghostty windows (not in nested shells or tmux)
    if [[ -z "$TMUX" ]] && [[ -z "$TMUX_SESSION_PROMPTED" ]] && [[ "$SHLVL" -eq 1 ]]; then
      export TMUX_SESSION_PROMPTED=1
      
      # Ensure terminal is ready
      sleep 0.1
      
      echo -n "Enter tmux session name (or press Enter to skip): "
      read session_name

      if [[ -n "$session_name" ]]; then
        # Check if session exists
        if tmux has-session -t "$session_name" 2>/dev/null; then
          echo -n "Session '$session_name' exists. Attach to it? (y/n): "
          read -r attach_choice
          
          if [[ "$attach_choice" =~ ^[Yy]$ ]]; then
            tmux attach-session -t "$session_name"
            exit
          fi
        else
          # Session doesn't exist, create it
          tmux new-session -s "$session_name"
          exit
        fi
      fi
    fi
  '';
}
