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

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
