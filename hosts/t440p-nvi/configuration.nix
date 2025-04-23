# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, lib, ... }:

{
  imports =
    [../../modules/nixos];

  nixOSModules = {
    programs = {
      android.enable = true;
    };

    desktops = {
      plasma.enable = true;
    };

    services = {
      bluetooth = {
        enable = true;
        batteryStatus = true;
      };
    };
  };

  networking.hostName = "t440p-nvi"; # Define your hostname..

  # Define a user account.
  users.users.tino = {
    isNormalUser = true;
    description = "Tino";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      kdePackages.plasma-vault
      thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.settings.download-buffer-size = 500000000; # 500 MB

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    #inputs.helix.packages."${pkgs.system}".helix
  ];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # https://nixos.org/nixos/options.html
  system.stateVersion = "24.11";

}
