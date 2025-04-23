{ pkgs, lib, config, ...}:

{
  options = {
    gaming.enable =
      lib.mkEnableOption "Gaming";
  };

  config = lib.mkIf config.gaming.enable {
    home.packages = [
      pkgs.heroic
    ];
  };    
}
