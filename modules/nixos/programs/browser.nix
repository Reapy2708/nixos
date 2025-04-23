{ pkgs, config, lib, ... }:

let
  cfg = config.nixOSModules.programs.browser;
in {
  options.nixOSModules.programs.browser = {
    enable =
      lib.mkEnableOption "Browsers";

    firefox =
      lib.mkEnableOption "Firefox";

    chromium =
      lib.mkEnableOption "Chromium";

    uBlockOrigin =
      lib.mkEnableOption "UBlockOrigin extension in all supporting browsers";
  };

  config = lib.mkIf config.nixOSModules.programs.browser.enable {
    programs.firefox = lib.mkIf config.nixOSModules.programs.browser.firefox {
      enable = true;
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DisablePocket = true;
        ExtensionSettings = {
          #"*".installation_mode = "blocked"; # blocks all addons except the ones specified below
          # uBlock Origin:
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
          };
          "plasma-browser-integration@kde.org" = lib.mkIf config.nixOSModules.desktops.plasma.enable {
            install_url = "https://addons-mozilla.org/firefox/downloads/latest/plasma-integration/latest.xpi";
            installation_mode = "force_installed";
          };
        };
      };
    };
    
    programs.chromium = lib.mkIf config.nixOSModules.programs.browser.chromium {
      enable = true;
      enablePlasmaBrowserIntegration = config.nixOSModules.desktops.plasma.enable;
      extensions = lib.mkIf config.nixOSModules.programs.browser.enable [
        "cjpalhdlnbpafiamejdnhcphjbkeiagm"
      ];
    };
  };
}
