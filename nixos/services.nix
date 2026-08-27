{ config, pkgs, ... }:

{
  services = {
    displayManager.ly = {
      enable = true;
      settings = {
        animation = "matrix";

        clock = "%T";

        clear_password = true;
        asterisk = "*";

        vi_mode = false;

        default_input = "login";
      };
    };

    kanata = {
      enable = true;

      keyboards.main = {
        configFile = ../config/kanata/kanata.kbd;
      };
    };

    xserver = {
      xkb = {
        layout = "us";
        variant = "";
      };

      videoDrivers = [ "modesetting" "nvidia" ];
    };
  };
}
