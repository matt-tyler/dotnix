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


  # xdg.configFile."ghostty/config".source = ./xdg/ghosty/config;


  programs = {
    opencode = {
      settings = {
        plugin = [
          "opencode-gemini-auth@latest"
        ];
        provider = {
          google = {
            options = {
              projectId = "fzo-gemini-dev";
            };
          };
        };
      };
    };
    git = {
      enable = true;
      settings = {
        user = {
          name = "Matt Tyler";
          email = "matt.tyler@qoria.com";
        };
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
