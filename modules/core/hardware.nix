{ config, pkgs, ... }:
{  
  hardware = {
    opengl.enable = true;
    
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.production;
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
    };
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
    
      ];
    };
  };
  hardware.enableRedistributableFirmware = true;
}
