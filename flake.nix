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

    darwinConfigurations."mini" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
            home-manager.darwinModules.home-manager
	    ./hosts/mini/config.nix
        ]; 
    };

    darwinConfigurations."AU-L-0300" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
            home-manager.darwinModules.home-manager
            ./hosts/AU-L-0300/config.nix
        ];
    };

  };
}
