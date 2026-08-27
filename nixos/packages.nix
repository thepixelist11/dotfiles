{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Editors
    vim
    neovim

    # Utils
    curl
    wget
    git
    btop
    tree
    fastfetch
    
    # Terminal
    kitty
    zsh
  ];

  programs.hyprland.enable = true;
}
