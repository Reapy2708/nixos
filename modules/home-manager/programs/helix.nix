{ pkgs, lib, config, helix, ... }:

{
  options = {
    helix.enable =
      lib.mkEnableOption "helix";
  };

  config = lib.mkIf config.helix.enable {
    programs.helix = {
      enable = true;
      package = pkgs.helix;
      defaultEditor = true;
      settings = {
        theme = "ayu_dark";
      };
    };
  };
}
