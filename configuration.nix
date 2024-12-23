{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings = {
    trusted-users = [ "llr" ];
    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [  "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  programs.nix-ld.enable = true;

  # Networking
  networking.hostName = "nixos-server-home";
  networking.networkmanager.enable = true;

  # Time and Locale
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # System-wide fonts
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  # User configuration
  users.users.llr = {
    isNormalUser = true;
    description = "llr";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "ssh-users"
    ];
    shell = pkgs.fish;
  };

  # System-wide services
  programs.ccache = {
    enable = true;
  };
  programs.fish.enable = true;
  virtualisation.docker.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    gcc
    clang
    egl-wayland
  ];
  services.openssh = {
    enable = true;
    ports = [ 22 ];  # Non-standard port
    settings = {
      PasswordAuthentication = false;  # Key-based auth only
      PermitRootLogin = "no";
      X11Forwarding = false;
      MaxAuthTries = 3;
      LoginGraceTime = 30;
      KbdInteractiveAuthentication = false;
      AllowTcpForwarding = false;
      AuthenticationMethods = "publickey";
    };
    extraConfig = ''
      AllowGroups ssh-users
      Protocol 2
    '';
  };
  networking.firewall.allowedTCPPorts = [ 22 ];


  system.stateVersion = "24.11";
}
