{ pkgs, lib, config, ... }:

{
  imports = [
    ./plasma.nix
  ];

  nixOSModules.desktops.plasma.enable = lib.mkDefault false;
}
