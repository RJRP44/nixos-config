{ pkgs, host, ... }: 
{
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    nameservers = [ "8.8.8.8" "8.8.4.4" "1.1.1.1" ];
    firewall = {
      enable = false;
      allowedTCPPorts = [ 22 80 443 3010 59010 59011 ];
      allowedUDPPorts = [ 3010 59010 59011 ];
    };
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}
