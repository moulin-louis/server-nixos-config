{ pkgs, ... }:
{
  imports = [
    ./kitty.nix
    ./tmux.nix
    ./fish.nix
  ];

  home = {
    username = "llr";
    homeDirectory = "/home/llr";
    enableNixpkgsReleaseCheck = false;

    packages = with pkgs; [
      # Development tools
      git
      vim
      neovim
      gcc
      gnumake
      binutils
      cmake
      pkg-config
      gdb
      python3
      python312Packages.pip
      nodejs
      corepack_22
      sccache

      # System utilities
      wget
      curl
      stow
      unzip
      ripgrep
      xclip

      # Applications
      jellyfin
      jellyfin-web
      jellyfin-ffmpeg
      discord
      qbittorrent
    ];

    sessionVariables = {
      EDITOR = "vim";
    };

    stateVersion = "24.05";
  };

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "moulin-louis";
      userEmail = "louis.moulin@outlook.fr";
    };

    firefox = {
      enable = true;
    };

  };

  # Your existing xresources configuration
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };
}
