{ config, lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  programs.alacritty = {
    enable = true;
    settings =  {
  env = {
    "TERM" = "xterm-256color";
  };

  window = {
    padding.x = 10;
    padding.y = 10;
    decorations = "buttonless";
    opacity = 0.8;
  };

  font = {
    size = 12.0;

    normal.family = "CaskaydiaCove Nerd Font";
    bold.family = "CaskaydiaCove Nerd Font";
    italic.family = "CaskaydiaCove Nerd Font";
  };

  colors = {
    # Default colors
    primary = {
      background = "#282828";
      foreground = "#ebdbb2";
    };

    # Normal colors
    normal = {
      black   = "#282828";
      red     = "#cc241d";
      green   = "#98971a";
      yellow  = "#d79921";
      blue    = "#458588";
      magenta = "#b16286";
      cyan    = "#689d6a";
      white   = "#a89984";

    };

    # Bright colors
    bright = {
      black   = "#928374";
      red     = "#fb4934";
      green   = "#b8bb26";
      yellow  = "#fabd2f";
      blue    = "#83a598";
      magenta = "#d3869b";
      cyan    = "#8ec07c";
      white   = "#ebdbb2";
    };
  };
};
};
}