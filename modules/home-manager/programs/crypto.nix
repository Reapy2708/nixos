{ pkgs, lib, config, ...}:

{
  options = {
    crypto.enable =
      lib.mkEnableOption "crypto";
  };


  config = lib.mkIf config.crypto.enable {
    home.packages = [
      pkgs.monero-gui
      pkgs.xmrig-mo
    ];
  };
}
