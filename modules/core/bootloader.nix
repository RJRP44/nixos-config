{ pkgs, ... }:
{
  boot.supportedFilesystems = [ "ntfs" ];
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
      gfxmodeEfi = "1600x1200";
      gfxmodeBios = "1600x1200";
      fontSize = 25;
      theme = pkgs.catppuccin-grub;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
