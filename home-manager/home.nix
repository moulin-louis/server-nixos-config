{ pkgs, ... }:
{
  imports = [
    ./fish.nix
  ];

  home = {
    username = "llr";
    homeDirectory = "/home/llr";
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.11";

    packages = with pkgs; [
      # Development tools
      git
      vim
      neovim
      gnumake
      binutils
      cmake
      pkg-config
      gdb
      python3
      python312Packages.pip

      # System utilities
      wget
      curl
      stow
      unzip
      ripgrep
      xclip
      bat
      eza
      nmap
    ];

    sessionVariables = {
      EDITOR = "vim";
    };

  };

  programs = {
    git = {
      enable = true;
      userName = "moulin-louis";
      userEmail = "louis.moulin@outlook.fr";
    };
  };
}
