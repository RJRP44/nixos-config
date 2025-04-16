{ pkgs, ... }: 
{


  environment.systemPackages = [ pkgs.cifs-utils ];
  services.rpcbind.enable = true;

  fileSystems."/home/romain/Ar-Men-Dock" = {
        device = "10.8.0.1:/dock";
        fsType = "nfs";
        options = [ "x-systemd.automount" "noauto" "x-systemd.idle-timeout=60" "x-systemd.device-timeout=5s" "x-systemd.mount-timeout=10s"];
      };


  fileSystems."/home/romain/Ar-Men-Vault" = {
        device = "10.8.0.1:/vault";
        fsType = "nfs";
        options = [ "x-systemd.automount" "noauto" "x-systemd.idle-timeout=60" "x-systemd.device-timeout=5s" "x-systemd.mount-timeouàt=10s"];
      };

  fileSystems."/home/romain/Ar-Men-Backup" = {
        device = "10.8.0.1:/backup";
        fsType = "nfs";
        options = [ "x-systemd.automount" "noauto" "x-systemd.idle-timeout=60" "x-systemd.device-timeout=5s" "x-systemd.mount-timeout=5s"];
      };
#    fileSystems."/home/romain/Ar-Men-Vault" = {
#      device = "//ar-men/vault";
#      fsType = "cifs";
#      options = let
#        # this line prevents hanging on network split
#        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s,rw";
#      in ["${automount_opts},credentials=/etc/nixos/smb-secrets,uid=1000"];
#    };

#        fileSystems."/home/romain/Ar-Men-Dock" = {
#          device = "//ar-men/dock";
#          fsType = "cifs";
#          options = let
#            # this line prevents hanging on network split
#            automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s,rw";
#          in ["${automount_opts},credentials=/etc/nixos/smb-secrets,uid=1000"];
#        };
    
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    fstrim.enable = true;
    printing.enable = true;
    printing.drivers = [ pkgs.hplip ];
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
          user = "romain";
        };
      };
    };
  };
  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';
  services.create_ap = {
    enable = false;
    settings = {
      INTERNET_IFACE = "enp2s0";
      WIFI_IFACE = "wlp0s20f3";
      SSID = "Ouchatbox-2MG3";
      PASSPHRASE = "";
    };
  };

  services.udev.extraRules = ''SUBSYSTEM=="usb", ATTR{idVendor}=="0925", ATTR{idProduct}=="3881", MODE="0666"'';
}
