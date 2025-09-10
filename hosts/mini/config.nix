{ pkgs, ... }:
{
  programs.zsh.enable = true;
  security.pam.services.sudo_local.touchIdAuth = true;
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
