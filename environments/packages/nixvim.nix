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
      lightline.enable = true;
      nvim-tree.enable = true;

      # languages
      nix.enable = true;
    };
  };
}
