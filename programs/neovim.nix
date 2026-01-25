{ pkgs }:
let
  guess-ident = pkgs.vimUtils.buildVimPlugin {
    name = "vim-guessident";
    src = pkgs.fetchFromGitHub {
      owner = "NMAC427";
      repo = "guess-indent.nvim";
      rev = "b8ae749fce17aa4c267eec80a6984130b94f80b2";
      sha256 = "sha256-fqQfyUaQBcVZ7bcFeWbLyse9spw97Dqt/B4JGPnaYcQ=";
      #hash = "sha256-bL33/S+caNmEYGcMLNCanFZyEYUOUmSsedCVBn4tV3g=";
    };
  };

  my-elixir-tools = pkgs.vimUtils.buildVimPlugin {
    name = "elixir-tools-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "elixir-tools";
      repo = "elixir-tools.nvim";
      rev = "4b3c1c23a83361559676981575083436cf9b7245";
      sha256 = "sha256-WdtUVNFX6aE44ADUPSs7LMPgmAAM5ERNyBQyOXLNVwk=";
    };
  };

  elixir-extras = pkgs.vimUtils.buildVimPlugin {
    name = "elixir-extras.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "emmanueltouzery";
      repo = "elixir-extras.nvim";
      rev = "dae2f715d03166bc4c3de26904feca80d366b077";
      sha256 = "sha256-unW3HKHemBR81D13MwZWfgwwBH5P4S0igSeRNzYg2yA=";
    };
  };
in
{
  enable = true;
  plugins = with pkgs.vimPlugins; [
    plenary-nvim
    telescope-fzf-native-nvim

    comment-nvim
    vim-tmux-navigator
    luasnip
    cmp_luasnip
    cmp-git
    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    cmp-cmdline
    trouble-nvim
    mason-lspconfig-nvim
    guess-ident
    none-ls-nvim
    opencode-nvim
    {
      plugin = snacks-nvim;
      type = "lua";
      config = builtins.readFile ./nvim/snacks.lua;
    }
    {
      plugin = nvim-web-devicons;
      type = "lua";
      config = builtins.readFile ./nvim/web-devicons.lua;
    }
    {
      plugin = nvim-treesitter.withAllGrammars;
      type = "lua";
      config = builtins.readFile ./nvim/treesitter.lua;
    }
    {
      plugin = mason-nvim;
      type = "lua";
      config = builtins.readFile ./nvim/mason.lua;
    }
    {
      plugin = trouble-nvim;
      type = "lua";
      config = builtins.readFile ./nvim/trouble.lua;
    }
    {
      plugin = alpha-nvim;
      type = "lua";
      config = builtins.readFile ./nvim/alpha.lua;
    }
    {
      plugin = nightfox-nvim;
      type = "lua";
      config = builtins.readFile ./nvim/nightfox.lua;
    }
    {
      plugin = lualine-nvim;
      type = "lua";
      config = builtins.readFile ./nvim/lualine.lua;
    }
    {
      plugin = leap-nvim;
      type = "lua";
      config = builtins.readFile ./nvim/leap.lua;
    }
    {
      plugin = telescope-nvim;
      type = "lua";
      config = builtins.readFile ./nvim/telescope.lua;
    }
    {
      plugin = nvim-tree-lua;
      type = "lua";
      config = builtins.readFile ./nvim/nvim-tree.lua;
    }
    {
      plugin = bufferline-nvim;
      type = "lua";
      config = builtins.readFile ./nvim/bufferline.lua;
    }
    {
      plugin = nvim-lspconfig;
      type = "lua";
      config = builtins.readFile ./nvim/lsp.lua;
    }
    {
      plugin = nvim-cmp;
      type = "lua";
      config = builtins.readFile ./nvim/cmp.lua;
    }
    auto-session

    neodev-nvim
    nvim-dap-go
    nvim-dap-ui
    nvim-dap-virtual-text
    telescope-dap-nvim
    {
      plugin = nvim-dap;
      type = "lua";
      config = builtins.readFile ./nvim/dap.lua;
    }
    git-worktree-nvim
    {
      plugin = gitsigns-nvim;
      type = "lua";
      config = builtins.readFile ./nvim/git.lua;
    }
    elixir-tools-nvim
    # elixir-extras

    lspkind-nvim
    copilot-lua
    copilot-cmp
    CopilotChat-nvim
  ];

  initLua = builtins.readFile ./nvim/init.lua;
}
