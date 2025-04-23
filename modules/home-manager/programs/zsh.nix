{ pkgs, config, lib, ... }:

let
  cfg = config.zsh;
in {
  options.zsh = {
    enable =
      lib.mkEnableOption "zsh";
  };

  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      shellAliases = {
        ".." = "cd ..";
        suhx = "sudo -E hx";
        nixupdate = "sudo nixos-rebuild switch --flake /etc/nixos#$(hostname)";
      };
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      initExtra = "source ~/.p10k.zsh";
      plugins = [
        {                                                                                   
          name = "powerlevel10k";                                                           
          src = pkgs.zsh-powerlevel10k;                                                     
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";                         
        }
      ];
    };
  };
}
