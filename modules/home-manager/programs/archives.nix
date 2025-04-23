{ pkgs, lib, config, ... }:
{
  options = {
    archives.enable =
      lib.mkEnableOption "Archives";
  };

  config = lib.mkIf config.archives.enable {
    home.packages = [
      pkgs.zip
      pkgs.unzip
      #pkgs.rar
      #pkgs.unrar
      pkgs.xz
    ];
  };
}
