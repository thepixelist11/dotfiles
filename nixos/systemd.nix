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
  };
}
