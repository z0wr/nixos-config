{ config, pkgs, ... }:

{
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # DE/WM
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Hardware configuration
  imports = [ "./hardware-configuration.nix" ];

  # Localisation
  time.timeZone = "Europe/London";
  console.keyMap = "uk";
  services.xserver.xkb.layout = "uk";

  # Network
  networking.hostName = "z0wr-desktop";
  networking.nameservers = [ "94.140.14.14" "94.140.15.15" ];

  # Packages
  environment.systemPackages = [
    # General
    pkgs.discord
    pkgs.libreoffice-qt6-fresh
    pkgs.librewolf
    pkgs.spotify
    pkgs.thunderbird

    # Gamedev
    pkgs.aseprite
    pkgs.godot

    # Development
    pkgs.golang
    pkgs.git
    pkgs.libgcc
    pkgs.python313
    pkgs.vscodium

    # Hacking
    pkgs.gobuster
    pkgs.metasploit
    pkgs.nmap
  ];

  # Programs
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    };
  };

  # Sound
  services.pipewire.enable = true;
  services.pipewire.alsa.enable = true;
  services.pipewire.pulse.enable = true;

  # Unfree software
  nixpkgs.config.allow.Unfree = true;

  # Users
  users.users.z0wr.isNormalUser = true;
  users.users.z0wr.description = "Zoe Wray";
  users.users.z0wr.extraGroups = [ "wheel" ];

  # Initial version - DO NOT CHANGE THIS!
  System.stateversion = "24.11";
}