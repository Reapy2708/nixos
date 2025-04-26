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
      steam.enable = false;
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

  networking.hostName = "yoga2"; # Define your hostname..

  # Define a user account.
  users.users.reapy = {
    isNormalUser = true;
    description = "Michel";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      kdePackages.plasma-vault
      #thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.settings.download-buffer-size = 300000000; # 300 MB

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    git
    which
    #inputs.helix.packages."${pkgs.system}".helix
    
    # Yoga 2 stuff
    iio-sensor-proxy
    maliit-keyboard
  ];

  hardware.sensor.iio.enable = true;

  networking.useNetworkd = true;
	systemd.network = {
		enable = true;
		netdevs = {
			"10-bond0" = {
				netdevConfig = {
					Kind = "bond";
					Name = "bond0";
				};
				bondConfig = {
					Mode = "active-backup";  # In the 802.3ad mode, I was getting huge log spam about link speed and duplex mode not being determined.
					MIIMonitorSec="0.800s";  # Unplugging the Ethernet cable turned full-duplex mode into half-duplex mode in /proc/net/bonding/bond0, but didn't fail over to wlan0.
					PrimaryReselectPolicy="better";  # Fixes recovery after plugging in USB eth0
				};
			};
		};
		networks = {
			"30-wlp0s20u2" = {
				matchConfig.Name = "wlp0s20u2";
				networkConfig.Bond = "bond0";
				networkConfig.PrimarySlave = true;  # without this line, unplugging and replugging the USB ethernet adapter would not reactivate the eth0 route. Curiously, unplugging/replugging the Ethernet cable itself still workde fine.
			};

			"30-wlp1s0" = {
				matchConfig.Name = "wlp1s0";
				networkConfig.Bond = "bond0";
			};

			"40-bond0" = {
				matchConfig.Name = "bond0";
				linkConfig.RequiredForOnline = "carrier";
				networkConfig.DHCP = "yes";
			};
		};
	};

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
