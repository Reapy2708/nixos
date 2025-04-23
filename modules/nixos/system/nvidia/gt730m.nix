{ pkgs, config, lib, ...  }:

let
  cfg = config.nixOSModules.system.nvidia.gt730m;
in {
  options.nixOSModules.system.nvidia.gt730m = {
    enable =
      lib.mkEnableOption "gt730m laptop graphics module";
  };

  config = lib.mkIf config.nixOSModules.system.nvidia.gt730m.enable {
    services.xserver.videoDrivers = [ "nvidia" ];
    nixpkgs.config.nvidia.acceptLicense = true;
  
    hardware.nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.legacy_390;

      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false; # gpu too old for this feature
      nvidiaSettings = true;

      prime = {
        sync.enable = true;
        nvidiaBusId = "PCI:2:0:0";
        intelBusId = "PCI:0:2:0";
      };
    };
  };
}
