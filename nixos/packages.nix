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
    
    # Web Browsers
    inputs.zen-browser.packages.${stdenv.hostPlatform.system}.default
  ];

  programs.hyprland.enable = true;
}
