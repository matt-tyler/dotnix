{ pkgs }:
{
  enable = true;
  plugins = with pkgs.vimPlugins; [
    plenary-nvim
    telescope-fzf-native-nvim
   
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
  ];

  extraLuaConfig = builtins.readFile ./nvim/init.lua;
}