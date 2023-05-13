{ pkgs }:
{
    enable = true;
    userName = "Matt Tyler";
    userEmail = "me@matthewtyler.io"
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
}
