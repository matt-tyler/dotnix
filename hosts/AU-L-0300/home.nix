{ pkgs, ... }:
{
  imports = [ ../home.nix ];
  home.packages = with pkgs; [
    (google-cloud-sdk.withExtraComponents [
      google-cloud-sdk.components.gke-gcloud-auth-plugin 
      #google-cloud-sdk.components.pubsub-emulator
    ])
    jdk
    terraform
    kubectl
    temporal
    protolint
    # dotnet-runtime_7
  ];
  programs = {
    git = {
      enable = true;
      userName = "Matt Tyler";
      userEmail = "matt.tyler@qoria.com";
      extraConfig = {
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
    };
  };
} 
