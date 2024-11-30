{ ... }: 
{
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    fstrim.enable = true;
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
}
