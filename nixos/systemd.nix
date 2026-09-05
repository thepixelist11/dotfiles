{ config, pkgs, ... }:

{
  systemd.services = {
    battery-charge-limit = {
      description = "Set battery charge limit (Lenovo).";
      wantedBy = [ "multi-user.target" ];
      serviceConfig.type = "oneshot";

      script = ''
        echo 1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
      '';
    };

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
