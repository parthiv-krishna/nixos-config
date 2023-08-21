# alacritty configuration, should be imported to home-manager

{ config, ... }: {
  programs.alacritty = {
    enable = true;

    settings = {
      env = {
        "TERM" = "xterm-256color";
      };

      window = {
        padding.x = 10;
        padding.y = 10;
        decorations = "Full";
        opacity = 0.95;
      };

      # use nerd font for symbols
      font = {
        size = 10.0;
        normal.family = "Lilex Nerd Font";
        bold.family = "Lilex Nerd Font";
        italic.family = "Lilex Nerd Font";
      };

      cursor.style = "Beam";

      # launch tmux on startup
      shell = {
        program = "bash";
        args = [
          "-c"
          "tmux"
        ];
      };

      # colors from Argonaut
      # https://github.com/pwaleczek/Argonaut-theme/
      colors = {
        primary = {
          background = "0x131623";
          foreground = "0xfffbf5";
        };

        cursor = {
          text       = "0xfffbf5";
          foreground = "0x9f9c9a";
        };

        normal = {
          black   = "0x131623";
          white   = "0xfffbf5";
          red     = "0xff000f";
          green   = "0x8de20b";
          blue    = "0x008ef9";
          cyan    = "0x00d9ec";
          magenta = "0x6d43a7";
          yellow  = "0xffba00";
        };

        bright = {
          black   = "0x444444";
          white   = "0xffffff";
          red     = "0xff2840";
          green   = "0xace25b";
          blue    = "0x0093ff";
          cyan    = "0x67fff1";
          magenta = "0x9b60ec";
          yellow  = "0xffd342";
        };
      };
    };
  };
}

