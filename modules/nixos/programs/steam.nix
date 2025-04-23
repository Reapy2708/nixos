{ pkgs, lib, config, ... }:

let
  cfg = config.nixOSModules.programs.steam;
in {
  options.nixOSModules.programs.steam = {
    enable =
      lib.mkEnableOption "steam";
  };

  config = lib.mkIf config.nixOSModules.programs.steam.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };
}
