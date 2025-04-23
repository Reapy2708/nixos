{ pkgs, lib, config, inputs, ... }:

let
  cfg = config.nixOSModules.system.grub;
in {
  options.nixOSModules.system.grub = {
    enable =
      lib.mkEnableOption "grub";
  };

  config = lib.mkIf config.nixOSModules.system.grub.enable {
    boot.loader = {
      efi = {
        canTouchEfiVariables = true;
      };
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        configurationLimit = 12;
        theme = inputs.nixos-grub-themes.packages.${pkgs.system}.nixos;
      };
    };
  };
}
