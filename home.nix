{
  pkgs,
  ...
}:
{
  home.username = "ben";
  home.homeDirectory = "/home/ben";

  home.packages = with pkgs; [
    kdePackages.breeze-icons
  ];

  home.stateVersion = "25.11";
}
