# tmux configuration, should be imported to home-manager

{ pkgs, ... }: {
  programs.tmux = {
    enable = true;

    plugins = with pkgs.tmuxPlugins; [
      fuzzback
      gruvbox
      prefix-highlight
      resurrect
      sensible
      sessionist
      urlview
      vim-tmux-navigator
    ];
  };
}

