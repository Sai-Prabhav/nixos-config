{ config, pkgs, lib, ... }:

{
  # match your user
  home.username = "greenflame41";
  home.homeDirectory = "/home/greenflame41";
  home.stateVersion = "24.11"; # sync with system.stateVersion

  # let HM install & manage itself
  programs.home-manager.enable = true;
  #programs.hyprland.enable = false;
  # now your user-level stuff:
  home.packages = with pkgs; [
    # …any other dot-files tools…
    zsh
    discord
    vscode
  ];
  nixpkgs.config.allowUnfree = true;

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      source = ~/nixos-config/hypr.conf
    '';
  };

  # example: enable zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    oh-my-zsh.enable = true;

    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
      nup = "sudo nixos-rebuild switch --flake ~/nixos-config";
    };
    history.size = 10000;
  };
  home.sessionVariables = {

    EDITOR = "vim";
  };

}

