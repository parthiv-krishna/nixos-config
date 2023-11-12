# neovim configuration, should be imported to home-manager

{ pkgs, config, ... }:
let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    ref = "nixos-23.05";
  });
in {
  imports = [
    nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    options = {
      # line numbers
      number = true;
      relativenumber = true;

      # search
      hlsearch = true;
      incsearch = true;
      ignorecase = true;
      showmatch = true;
      smartcase = true;

      # whitespace
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
    };

    colorschemes = {
      gruvbox.enable = true;
    };

    plugins = {
      # tools
      barbar.enable = true;
      fugitive.enable = true;
      gitsigns.enable = true;
      lightline.enable = true;
      mark-radar.enable = true;
      nvim-tree.enable = true;
      telescope.enable = true;
      tmux-navigator.enable = true;
      todo-comments.enable = true;
      treesitter.enable = true;

      # languages
      markdown-preview.enable = true;
      nix.enable = true;
      rust-tools.enable = true;
    };
  };
}
