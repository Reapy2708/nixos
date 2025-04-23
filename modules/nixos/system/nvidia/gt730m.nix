{ pkgs, config, lib }:

let
  cfg = config.nixOSModules.system.nvidia.gt730m;
in {
  options.nixOSModules.system.nvidia.gt730m = {
    enable =
      lib.mkEnableOption "gt730m laptop graphics module"
  };

  config = lib.mkIf config.nixOSModules.system.nvidia.gt730m.enable {
    hardware.nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.legacy_390;

      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false; # gpu too old for this feature
      nvidiaSettings = true;
      
    };
  };
}
