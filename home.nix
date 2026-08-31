{
  pkgs,
  config,
  ...
}:
{
  home.username = "ben";
  home.homeDirectory = "/home/ben";

  home.packages = with pkgs; [
    kdePackages.breeze
    brightnessctl
    hyprsunset
    remmina
    obsidian
    pywal16
    libqalculate
    grimblast
    qimgv
    wofi
    awww
    waypaper
  ];

  programs.thunderbird.enable = true;

  services.hyprsunset = {
    enable = true;
    package = pkgs.hyprsunset;
    settings = {
      max-gamma = 150;

      # TODO: Use file in dotfiles/config
      profile = [
        {
          time = "7:30";
          identity = true;
        }
        {
          time = "21:00";
          temperature = 4500;
          gamma = 0.7;
        }
      ];
    };
  };

  home.sessionVariables = {
    WALLPAPER_DIR = "${config.home.homeDirectory}/Media/Wallpaper";
    GRIM_DEFAULT_DIR = "{config.home.homeDirectory}/Media/Screenshots";
  };

  home.stateVersion = "25.11";
}
