{ pkgs, ... }:
{
  security.rtkit.enable = true;
  security.sudo.enable = true;
  # security.pam.services.swaylock = { };
  security.pam.services.hyprlock = {};
  security.pam.services.hyprlock.fprintAuth = true;

    services.fprintd = {
      enable = true;
      package = pkgs.fprintd-tod;
      tod.enable = true;
      # Search for "libfprint" in packages to find other drivers
      tod.driver = pkgs.libfprint-2-tod1-goodix;
    };
}
