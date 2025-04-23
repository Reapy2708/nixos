{ pkgs, lib, config, ... }:

let
  cfg = config.nixOSModules.desktops.plasma;
in {
  options.nixOSModules.desktops.plasma = {
    enable =
      lib.mkEnableOption "plasma";
  };

  config = lib.mkIf config.nixOSModules.desktops.plasma.enable {
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;
  };
}
