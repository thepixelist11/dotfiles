{ pkgs, ... }:

{
  users.users."ben" = {
    isNormalUser = true;

    description = "Ben";

    shell = pkgs.zsh;

    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };
}
