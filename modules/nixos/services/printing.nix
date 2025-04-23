{ pkgs, lib, config, ... }:

let
  cfg = config.nixOSModules.services.printing;
in {
  options.nixOSModules.services.printing = {
    enable =
      lib.mkEnableOption "CUPS printing server";
  };

  config = lib.mkIf config.nixOSModules.services.printing.enable {
    services.printing.enable = true;
  };
}
