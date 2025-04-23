{ pkgs, lib, config, ... }:

let
  cfg = config.nixOSModules.system.pipewire;
in {
  options.nixOSModules.system.pipewire = {
    enable =
      lib.mkEnableOption "pipewire audioserver";
  };

  config = lib.mkIf config.nixOSModules.system.pipewire.enable {
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
