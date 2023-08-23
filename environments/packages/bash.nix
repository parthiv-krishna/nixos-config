# bash configuration, should be imported to home-manager

{ ... }: {
  programs.bash = {
    enable = true;

    enableCompletion = true;
    
    shellAliases = {
      rm = "echo \"rm is disabled, please use trash\"";
    };

    shellOptions = [
      "autocd"
      "cdable_vars"
      "cdspell"
      "dirspell"
      "globstar"
      "histverify"
    ];
  };
}

