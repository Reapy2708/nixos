{ pkgs, lib, config, ... }:

{
  imports = [
    ./gaming.nix
    ./archives.nix
    ./systools.nix
    ./crypto.nix
    ./kitty.nix
    ./helix.nix
    ./zsh.nix
    ./git.nix
    ./networkmanager-dmenu.nix
  ];

  gaming.enable = lib.mkDefault false;
  archives.enable = lib.mkDefault true;
  systools.enable = lib.mkDefault true;
  crypto.enable = lib.mkDefault false;
  kitty.enable = lib.mkDefault true;
  helix.enable = lib.mkDefault true;
  zsh.enable = lib.mkDefault true;
  git.enable = lib.mkDefault true;
  networkmanager-dmenu.enable = lib.mkDefault true;
}
