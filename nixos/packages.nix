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
    qutebrowser
    zen-browser
  ];

  programs.hyprland.enable = true;
}
