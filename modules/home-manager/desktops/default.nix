{ pkgs, lib, config, ... }:

{
  imports = [
    ./hyprland.nix
  ];

  hyprland.enable = lib.mkDefault false;
}
