{ pkgs, lib, config, ... }:

  let
    cfg = config.nixOSModules.services.bluetooth;
  in {
    options.nixOSModules.services.bluetooth = {
      enable =
        lib.mkEnableOption "bluetooth";

      powerOnBoot =
        lib.mkEnableOption "powerOnBoot";
    
      batteryStatus =
        lib.mkEnableOption "experimental bluetooth features to get access to battery status";
  };

  config = lib.mkIf config.nixOSModules.services.bluetooth.enable {
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = config.nixOSModules.services.bluetooth.powerOnBoot;
    hardware.bluetooth.settings = lib.mkIf config.nixOSModules.services.bluetooth.batteryStatus {
      General = {
        Experimental = true;
      };
    };
  };
}
