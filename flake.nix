{
  description = "My first nix flake";

  inputs = {
    # Package sets
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-22.11-darwin";
    nixpkgs-unstable.url = github:NixOS/nixpkgs/nixpkgs-unstable;

    # Environment/system management
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };
  
  # add the inputs declared above to the argument attribute set
  outputs = { darwin, home-manager, nixpkgs, ... }: {

    darwinConfigurations."MacBook-Pro" = darwin.lib.darwinSystem {
    # you can have multiple darwinConfigurations per flake, one per hostname
        system = "aarch64-darwin"; # "x86_64-darwin" if you're using a pre M1 mac

        modules = [
            home-manager.darwinModules.home-manager
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
        ]; # will be important later
    };
  };
}