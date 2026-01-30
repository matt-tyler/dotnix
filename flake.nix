{
  description = "My first nix flake";

  inputs = {
    # Package sets
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-25.05-darwin";
    nixpkgs-unstable.url = github:NixOS/nixpkgs/nixpkgs-unstable;

    # Environment/system management
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs-unstable";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  # add the inputs declared above to the argument attribute set
  outputs = { darwin, home-manager, nixpkgs, nix-homebrew, homebrew-core, homebrew-cask, ... }:
    let
      allowUnfree = {
        nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [ "terraform" "cockroachdb-bin" ];
        nixpkgs.config.allowBroken = true;
      };
    in
    {
      darwinConfigurations."mini" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "matt.tyler";

              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
              };

              autoMigrate = true;
              mutableTaps = false;
            };
          }
          ({config, ...}: {
            homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
          })
          {
            ids.gids.nixbld = 30000;
            system.stateVersion = 5;
            system.primaryUser = "matt.tyler";
          }
          home-manager.darwinModules.home-manager
          ./hosts/mini/config.nix
          allowUnfree
        ];
      };

      darwinConfigurations."AU-L-0300" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "matthewtyler";

              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
              };

              autoMigrate = true;
              mutableTaps = false;
            };
          }
          ({config, ...}: {
            homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
          })
          {
            system.stateVersion = 5;
            system.primaryUser = "matthewtyler";
          }
          home-manager.darwinModules.home-manager
          ./hosts/AU-L-0300/config.nix
          allowUnfree
        ];
      };

    };
}
