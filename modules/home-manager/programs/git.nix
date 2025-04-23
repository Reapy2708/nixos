{ pkgs, config, lib, ... }:

{
  options = {
    git.enable =
      lib.mkEnableOption "Git";
  };

  config = {
    programs.git = {
      package = pkgs.gitAndTools.gitFull;
      enable = true;
      userName = "Reapy2708";
      userEmail = "Michelw278@gmail.com"
      extraConfig = {
        color = {
          ui = "auto";
        }  
      };
    };
  };
}
