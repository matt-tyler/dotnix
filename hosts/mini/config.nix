{ pkgs, ... }:
{
  services.nix-daemon.enable = true;
  programs.zsh.enable = true;
  security.pam.enableSudoTouchIdAuth = true;
  users.users = {
    "matt.tyler" = {
      name = "matt.tyler";
      home = "/Users/matt.tyler";
    };
  };
  home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users."matt.tyler" = import ./home.nix;

  };
}
