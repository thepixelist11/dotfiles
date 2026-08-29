{
  pkgs,
  ...
}:
{
  home.username = "ben";
  home.homeDirectory = "/home/ben";

  home.packages = with pkgs; [
    kdePackages.breeze
    brightnessctl
    hyprsunset
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

  home.stateVersion = "25.11";
}
