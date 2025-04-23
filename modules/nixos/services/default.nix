{ pkgs, config, lib, ... }:

{
  imports = [
    ./networkmanager.nix
    ./printing.nix
    ./bluetooth.nix
  ];

  nixOSModules.services.networkmanager.enable = lib.mkDefault true;
  nixOSModules.services.printing.enable = lib.mkDefault false;
  nixOSModules.services.bluetooth = {
    enable = lib.mkDefault false;
    powerOnBoot = lib.mkDefault false;
    batteryStatus = lib.mkDefault false;
  };
}
