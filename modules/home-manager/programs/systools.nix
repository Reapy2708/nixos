{ pkgs, lib, config, ... }:

{
  options.systools = {
    enable =
      lib.mkEnableOption "systools";
  };

  config = lib.mkIf config.systools.enable {
    home.packages = [
      pkgs.file
      pkgs.which
      pkgs.tree
      pkgs.gnupg
      pkgs.btop
      pkgs.strace
      pkgs.ltrace
      pkgs.lsof
      pkgs.sysstat
      pkgs.lm_sensors
      pkgs.ethtool
      pkgs.pciutils
      pkgs.usbutils
      pkgs.gparted
    ];

  };
}
