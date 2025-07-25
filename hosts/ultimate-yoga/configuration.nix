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
      steam.enable = true;
    };

    desktops = {
      plasma.enable = true;
      hyprland.enable = false;
    };

    services = {
      bluetooth = {
        enable = true;
        batteryStatus = true;
      };
    };
  };

  networking.hostName = "ultimate-yoga"; # Define your hostname..

  # Define a user account.
  users.users.sinan = {
    isNormalUser = true;
    description = "Sinan";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      kdePackages.plasma-vault
      thunderbird
      iio-sensor-proxy
      maliit-keyboard
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
    git
    which
    vscode
    python314
    jdk17
    #inputs.helix.packages."${pkgs.system}".helix
  ];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  #Enable flatpak
  services.flatpak.enable = true;


services.printing.enable = true;
  services.avahi = {
  enable = true;
  nssmdns4 = true;
  openFirewall = true;
};

hardware.printers = {
  ensurePrinters = [
    {
      name = "epson-xp-442";
      location = "Home";
      deviceUri = "usb://Dell/1250c%20Color%20Printer?serial=YNP023240";
      model = "Dell-1250c.ppd.gz";
      ppdOptions = {
        PageSize = "A4";
      };
    }
  ];
};


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # https://nixos.org/nixos/options.html
  system.stateVersion = "24.11";

}
