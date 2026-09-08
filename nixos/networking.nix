{
  networking.hostName = "ben";

  networking.wireless.enable = true;
  networking.networkmanager.enable = true;

  networking.firewall.allowedTCPPorts = [
    5173
    5670
  ];
  networking.firewall.allowedUDPPorts = [ ];
}
