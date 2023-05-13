{ pkgs, ... }:
{
  services.nix-daemon.enable = true;
  programs.zsh.enable = true;
  security.pam.enableSudoTouchIdAuth = true;
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
}
