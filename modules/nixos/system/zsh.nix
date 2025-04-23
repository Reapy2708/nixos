{ pkgs, lib, config, ... }:

let
  cfg = config.nixOSModules.system.zsh;
in {
  options.nixOSModules.system.zsh = {
    enable =
      lib.mkEnableOption "zsh";
  };

  config = lib.mkIf config.nixOSModules.system.zsh.enable {
    programs.zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
        theme = "agnoster";
        plugins = [
          "git"
        ];
      };
    };

    environment.pathsToLink = [ "/share/zsh" ];
    users.defaultUserShell = pkgs.zsh;


    # powerlevel10k font & ohmyzsh
    environment.systemPackages = [pkgs.meslo-lgs-nf pkgs.oh-my-zsh];
  };
}
  
