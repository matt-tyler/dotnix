{ pkgs, ... }:
{
  programs.zsh.enable = true;
  security.pam.services.sudo_local.touchIdAuth = true;
  users.users = {
    "matthewtyler" = {
      name = "matthewtyler";
      home = "/Users/matthewtyler";
    };
  };
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users."matthewtyler" = import ./home.nix;
  };

  homebrew = {
    enable = true;
    casks = [
      "ghostty"
      # "visual-studio-code"
      # "firefox"
      # "postman"
      # "slack"
      # "google-drive"
    ];
  };

}
