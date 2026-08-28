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
    eza
    bat
    dust
    tty-clock
    trash-cli
    zoxide
    fd
    difftastic
    jq
    ripgrep

    # Archiving
    unzip
    gzip
    bzip2
    unrar
    p7zip
    ncompress

    # Terminal
    kitty

    # Development
    gcc
    gnumake
    binutils
    gdb
    volta
    python3
    go
    cargo
    rustc

    # Desktop Environment
    hyprpaper
    wl-clipboard
    cliphist
    wofi

    # Misc
    tree-sitter
  ];

  # Enabled for Volta
  programs.nix-ld.enable = true;

  programs.zsh.enable = true;

  programs.direnv.enable = true;
}
