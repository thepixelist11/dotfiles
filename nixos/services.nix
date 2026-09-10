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

      videoDrivers = [
        "modesetting"
        "nvidia"
      ];
    };

    tlp = {
      enable = true;

      settings = {
        INTEL_GPU_MIN_FREQ_ON_AC = 500;
        INTEL_GPU_MIN_FREQ_ON_BAT = 300;
      };
    };

    ratbagd.enable = true;

    udev = {
      extraRules = ''
        KERNEL=="card*", SUBSYSTEM=="drm", KERNELS=="0000:00:02.0", SYMLINK+="gpus/igpu"
        KERNEL=="card*", SUBSYSTEM=="drm", KERNELS=="0000:01:00.0", SYMLINK+="gpus/dgpu"
      '';
    };
  };
}
