{ pkgs, lib, config, ... }:

let
  cfg = config.nixOSModules.services.networkmanager;
in {
  options.nixOSModules.services.networkmanager = {
    enable =
      lib.mkEnableOption "Networkmanager";
  };

  config = lib.mkIf config.nixOSModules.services.networkmanager.enable {
    networking.networkmanager.enable = true;
  };
}
