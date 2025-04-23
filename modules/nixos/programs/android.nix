{ pkgs, lib, config, ... }:

  let
    cfg = config.nixOSModules.programs.android;
  in {
    options.nixOSModules.programs.android = {
      enable =
        lib.mkEnableOption "android virtualisation through waydroid";
    };

  config = lib.mkIf config.nixOSModules.programs.android.enable {
    virtualisation.waydroid.enable = true;
  };
}
