{ pkgs, lib, config, ... }:

{
  imports = [
    ./plasma.nix
    ./hyprland.nix
  ];

  nixOSModules.desktops.plasma.enable = lib.mkDefault false;
  nixOSModules.desktops.hyprland.enable = lib.mkDefault false;
}
