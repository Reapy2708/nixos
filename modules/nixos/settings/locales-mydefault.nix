{ pkgs, lib, config, ... }:

let
  cfg = config.nixOSModules.settings.locales-mydefault;
in {
  options.nixOSModules.settings.locales-mydefault = {
    enable =
      lib.mkEnableOption "my default locales";
  };

  config = lib.mkIf config.nixOSModules.settings.locales-mydefault.enable {
    time.timeZone = "Europe/Berlin";

    i18n.defaultLocale = "de_DE.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
  };
}
