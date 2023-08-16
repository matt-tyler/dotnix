{ pkgs }:
let
  guess-ident = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "vim-guessident";
    src = pkgs.fetchFromGitHub {
      owner = "NMAC427";
      repo = "guess-indent.nvim";
      rev = "b8ae749fce17aa4c267eec80a6984130b94f80b2";
      sha256 = "sha256-fqQfyUaQBcVZ7bcFeWbLyse9spw97Dqt/B4JGPnaYcQ=";
      #hash = "sha256-bL33/S+caNmEYGcMLNCanFZyEYUOUmSsedCVBn4tV3g=";
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
    null-ls-nvim
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
      plugin = lightspeed-nvim;
      type = "lua";
      config = builtins.readFile ./nvim/lightspeed.lua;
    }
    {
      plugin = project-nvim;
      type = "lua";
      config = builtins.readFile ./nvim/project_nvim.lua;
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
    rust-tools-nvim
    # copilot-lua
  ];

  extraLuaConfig = builtins.readFile ./nvim/init.lua;
}
