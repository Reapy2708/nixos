{ config, pkgs, inputs, lib, ... }:

{
  home.username = "reapy";
  home.homeDirectory = "/home/reapy";

  home.sessionVariables = {
    TERMINAL = "kitty";
  };
  
  imports = [
    ../../modules/home-manager
  ];

  gaming.enable = false;
  crypto.enable = false;
  zsh.enable = true;
  hyprland.enable = false;
  #home.packages = with pkgs; [];

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
