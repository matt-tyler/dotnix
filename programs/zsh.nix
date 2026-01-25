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
}
