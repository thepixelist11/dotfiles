{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./nixos/fonts.nix
    ./nixos/systemd.nix
    ./nixos/packages.nix
    ./nixos/services.nix
    ./nixos/networking.nix
    ./nixos/users.nix
    ./nixos/boot.nix
    ./nixos/modules/nvidia.nix
    ./nixos/modules/wireguard.nix
    ./nixos/modules/zen-browser.nix
    ./nixos/modules/hyprland.nix
    ./nixos/modules/virtualization.nix
    ./nixos/modules/steam.nix
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Regional Settings
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "26.05";
}
