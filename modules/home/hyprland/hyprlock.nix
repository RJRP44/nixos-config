{ pkgs, ... }:
let 
  text = "rgb(251, 241, 199)";
in
{
  home.packages = [ pkgs.hyprlock ];
  xdg.configFile."hypr/hyprlock.conf".text = ''
    # BACKGROUND
    background {
      monitor =
      path = ${../../../wallpapers/otherWallpaper/gruvbox/forest.jpg}
      blur_passes = 2
      contrast = 0.8916
      brightness = 0.8172
      vibrancy = 0.1696
      vibrancy_darkness = 0.0
    }

    # GENERAL
    general {
      hide_cursor = true
      no_fade_in = false
      grace = 0
      disable_loading_bar = false
      ignore_empty_input = true
      fractional_scaling = 0
    }

    # Time
    label {
      monitor = 
      text = cmd[update:1000] echo "$(date +"%k:%M")"
      color = rgba(235, 219, 178, .9)
      font_size = 70
      shadow_passes = 3
      font_family = JetBrainsMono NF Bold
      position = 0, 270
      halign = center
      valign = center
    }

    # Day
    label {
      monitor =
      text = cmd[update:1000] echo "- $(date +"%A, %B %d") -"
      color = rgba(235, 219, 178, .9)
      font_size = 14
      font_family = CaskaydiaCove Nerd Font
      shadow_passes = 3
      position = 0, 160
      halign = center
      valign = center
    }


    # USER-BOX
    shape {
      monitor =
      size = 350, 50
      color = rgba(225, 225, 225, .2)
      rounding = 15
      border_size = 0
      border_color = rgba(255, 255, 255, 0)
      rotate = 0

      position = 0, -230
      halign = center
      valign = center
    }

    # USER
    label {
      monitor =
      text = Привет, $USER 👋
      color = rgba(235, 219, 178, .9)
      font_size = 16
      font_family = CaskaydiaCove Nerd Font
      position = 0, -230
      halign = center
      valign = center
    }

    # INPUT FIELD
    input-field {
      monitor =
      size = 350, 50
      outline_thickness = 1
      rounding = 10
      dots_size = 0.25 # Scale of input-field height, 0.2 - 0.8
      dots_spacing = 0.4 # Scale of dots' absolute size, 0.0 - 1.0
      dots_center = true
      outer_color = rgba(255, 255, 255, 0)
      inner_color = rgba(225, 225, 225, 0.2)
      color = rgba(235, 219, 178, .9)
      font_color = rgba(235, 219, 178, .9)
      fade_on_empty = false
      placeholder_text = <i><span foreground="##ebdbb2e5">Enter Password</span></i>
      hide_input = false
      position = 0, -300
      halign = center
      valign = center
    }
  '';
}
