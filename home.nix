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
    glib
    gowall
    eww
    tokei
    julia
    git-credential-manager
    zathura
    rclone
    calibre
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
          temperature = 5000;
          gamma = 1;
        }
      ];
    };
  };

  services.ssh-agent.enable = true;

  home.sessionVariables = {
    WALLPAPER_DIR = "${config.home.homeDirectory}/Media/Wallpaper";
    GRIM_DEFAULT_DIR = "{config.home.homeDirectory}/Media/Screenshots";
  };

  home.file.".icons/breeze_cursors".source = "${pkgs.kdePackages.breeze}/share/icons/breeze_cursors";

  home.stateVersion = "25.11";
}
