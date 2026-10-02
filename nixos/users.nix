{ pkgs, ... }:

{
  users.users."ben" = {
    isNormalUser = true;

    description = "Ben";

    shell = pkgs.fish;

    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };
}
