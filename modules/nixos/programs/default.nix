{ pkgs, config, lib, ... }:

{
  imports = [
    ./android.nix
    ./browser.nix
    ./steam.nix
  ];

  nixOSModules.programs.android.enable = lib.mkDefault false;
  nixOSModules.programs.steam.enable = lib.mkDefault false;
  nixOSModules.programs.browser = {
    enable = lib.mkDefault true;
    chromium = lib.mkDefault false;
    firefox = lib.mkDefault true;
  };
}
