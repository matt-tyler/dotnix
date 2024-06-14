{ pkgs, inputs', ... }: {
  gopls = pkgs.callPackage ./gopls.nix {};
}
