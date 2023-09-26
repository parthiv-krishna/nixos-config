# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" "caps:escape" ];
    };

    "org/gnome/desktop/interface" = {
      clock-show-seconds = false;
      clock-show-weekday = true;
      color-scheme = "prefer-dark";
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      text-scaling-factor = 1.25;
      toolkit-accessibility = true;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/wm/keybindings" = {
      minimize = [];
      switch-applications = [];
      switch-applications-backward = [];
      switch-windows = [ "<Alt>Tab" ];
      switch-windows-backward = [ "<Shift><Alt>Tab" ];
    };

    "org/gnome/desktop/wm/preferences" = {
      auto-raise = true;
    };

    "org/gnome/shell" = {
      disabled-extensions = [ "window-list@gnome-shell-extensions.gcampax.github.com" "windowsNavigator@gnome-shell-extensions.gcampax.github.com" "workspace-indicator@gnome-shell-extensions.gcampax.github.com" "launch-new-instance@gnome-shell-extensions.gcampax.github.com" "native-window-placement@gnome-shell-extensions.gcampax.github.com" ];
      enabled-extensions = [ "apps-menu@gnome-shell-extensions.gcampax.github.com" "forge@jmmaranan.com" ];
    };

    "org/gnome/shell/extensions/forge" = {
      tiling-mode-enabled = true;
    };
  };
}
