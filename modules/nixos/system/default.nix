{ pkgs, lib, config, ... }:

{
  imports = [
    ./nvidia
    ./grub.nix
    ./zsh.nix
    ./pipewire.nix
  ];

  nixOSModules.system.grub.enable = lib.mkDefault true;
  nixOSModules.system.zsh.enable = lib.mkDefault true;
  nixOSModules.system.pipewire.enable = lib.mkDefault true;
}
