# git configuration, should be imported to home-manager

{ ... }: {
  programs.git = {
    enable = true;

    userName = "Parthiv Krishna";
    userEmail = "parthiv-krishna@users.noreply.github.com";

    aliases = {
      a = "add";
      ap = "add -p";
      au = "add -u";

      b = "branch";
      bv = "branch -v";

      bs = "bisect";
      bsb = "bisect bad";
      bsg = "bisect good";

      c = "commit";
      ca = "commit amend --no-edit";
      cam = "commit amend -m";
      cm = "commit -m";

      co = "checkout";
      cob = "checkout -b";

      d = "diff";
      ds = "diff --staged";
      dsw = "diff --staged --word-diff";
      dw = "diff --word-diff";

      r = "reset";

      s = "status";
      su = "status -uno";
    };
  };
}

