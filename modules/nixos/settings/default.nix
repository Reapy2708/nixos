{ pkgs, config, lib, ... }:

{
  imports = [
    ./locales-mydefault.nix
  ];

  nixOSModules.settings.locales-mydefault = {
    enable = lib.mkDefault true;
  };
}
