{ pkgs, config, lib, ...}:

let
  cfg = config.nixOSModules.services.flameshot;
in {
  options.nixOSModules.services.flameshot = {
    enable =
      lib.mkEnableOption "flameshot";
  };

  config = lib.mkIf config.nixOSModules.services.flameshot.enable {
    services.flameshot = {
        enable = true;
        settings.General = { showStartupLaunchMessage = false; 
      };
  };
