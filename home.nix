{ pkgs, ... }:
{
  home.stateVersion = "22.05";
  home.packages = with pkgs; [
    tmux
    alacritty
    oh-my-zsh
    zsh
    git
    gh
  ];

  home.sessionVariables = {
    EDITOR = "neovim";
  };

  programs.home-manager.enable = true;

  programs.tmux = {
    enable = true;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      shell = {
        program = "zsh";
        args = [ "-l" "-c" "tmux" "new-session" "-A" "-s" "main" ];
      };
    };
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
    shellAliases = {
      vi = "nvim";
      vim = "nvim";
    };
  };

  programs.git = {
    enable = true;
    userName = "Matt Tyler";
    userEmail = "me@matthewtyler.io";
    extraConfig = {
      credentials.helper = "osxkeychain";
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

  programs.neovim.enable = true;

  programs.neovim.plugins = with pkgs.vimPlugins; [
    vim-airline
    tmuxline-vim
    vim-easymotion
    ctrlp-vim
    nerdcommenter
    nerdtree
    YouCompleteMe
    gundo-vim
    tagbar
    vim-polyglot
  ];

  programs.neovim.coc.enable = true;

  programs.neovim.extraConfig = ''
    filetype plugin indent on
    syntax on
    " set background=dark
    " colorscheme NeoSolarized

    set number

    set foldmethod=indent
    set foldlevel=99

    set colorcolumn=80

    set backspace=indent,eol,start

    set showcmd

    set tabstop=4

    map <leader>c <plug>NERDCommenterAlignLeft
    map <leader>u <plug>NERDCommenterUncomment
    map <leader>n :NERDTreeToggle<CR>
    map <leader>g :GundoToggle<CR>
    map <leader>t :CtrlP<CR>
    " map <leader>m :MiniBufExpl<CR>
    nmap <F8> :TagbarToggle<CR>

    let g:ctrlp_max_files=0

    autocmd Filetype yaml setlocal ts=2 sts=2 sw=2 expandtab
  '';
}
