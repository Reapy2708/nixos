{ config, pkgs, inputs, lib, ... }:

{
  home.username = "sinan";
  home.homeDirectory = "/home/sinan";

  home.sessionVariables = {
    TERMINAL = "kitty";
  };
  
  imports = [
    ../../modules/home-manager
  ];

  gaming.enable = true;
  crypto.enable = false;
  zsh.enable = true;
  hyprland.enable = false;
  home.packages = with pkgs; [
    obsidian
    vesktop
    geogebra6
  ];

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
