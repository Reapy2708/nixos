{ pkgs, lib, config, ... }:

let
  cfg = config.nixOSModules.system.fsdrivers;
in {
  options.nixOSModules.system.fsdrivers = {
    enable =
      lib.mkEnableOption "extra filesystem drivers"
  };

  config = lib.mkIf config.nixOSModules.system.fsdrivers.enable {
    environment.systemPackages = [
      pkgs.ntfs3g
    ];
  }
}
