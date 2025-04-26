{ config, pkgs, inputs, lib, ... }:

{
  home.username = "tino";
  home.homeDirectory = "/home/tino";

  home.sessionVariables = {
    TERMINAL = "kitty";
  };
  
  imports = [
    ../../modules/home-manager
  ];

  zsh.enable = true;
  #home.packages = with pkgs; [];

  services.flameshot = {
        enable = true;
        settings.General = { showStartupLaunchMessage = false; };
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
