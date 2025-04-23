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

  gaming.enable = true;
  crypto.enable = true;
  zsh.enable = true;
  #home.packages = with pkgs; [];

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
