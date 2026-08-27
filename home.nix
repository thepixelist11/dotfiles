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

  programs.thunderbird.enable = true;

  home.stateVersion = "25.11";
}
