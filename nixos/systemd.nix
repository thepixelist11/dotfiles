{ config, pkgs, ... }:

{
  systemd.services = {
    # battery-charge-limit = {
    #   description = "Set battery charge limit.";
    #   wantedBy = [ "multi-user.target" ];
    #   serviceConfig.type = "oneshot";
    #
    #   script = ''
    #     echo 70 > /sys/class/power_supply/BAT1/charge_control_start_threshold
    #     echo 80 > /sys/class/power_supply/BAT1/charge_control_end_threshold
    #   '';
    # };

    nvidia-gpu-clock = {
      wantedBy = [ "multi-user.target" ];
      after = [ "nvidia-persistenced.service" ];
      wants = [ "nvidia-persistenced.service" ];

      serviceConfig = {
        type = "oneshot";
        RemainAfterExit = true;
      };

      script = ''
        ${config.boot.kernelPackages.nvidia_x11.bin}/bin/nvidia-smi \
          --lock-gpu-clocks=500,3105
      '';
    };
  };
}
