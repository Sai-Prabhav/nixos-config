{ config, pkgs, lib, ... }:

{
  # match your user
  home.username = "greenflame41";
  home.homeDirectory = "/home/greenflame41";
  home.stateVersion = "24.11"; # sync with system.stateVersion
  programs.git = {
    enable = true;
    userName = "Sai-Prabhav";
    userEmail = "saiprabhav.ss@gmail.com";
  };
  # let HM install & manage itself
  programs.home-manager.enable = true;
  #programs.hyprland.enable = false;
  # now your user-level stuff:
  home.packages = with pkgs; [

    bluez
    bluez-tools
    zsh
    discord
    vscode
    gdb
    gcc
    libffi
    killall
    pavucontrol
    mongodb
    yarn
    nodejs_23
    nodePackages_latest.vercel
    obsidian
    texlive.combined.scheme-medium
    (pkgs.python312.withPackages
      (ps: with ps; [ pip numpy jupyter notebook matplotlib sympy]))
  ];

  nixpkgs.config.allowUnfree = true;

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      source = ~/nixos-config/hypr/hypr.conf
    '';
  };

  # example: enable zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh.enable = true;
    plugins = [{
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }];
    initContent = ''
      # To customize prompt, run `p10k configure`
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';

    shellAliases = {

      ll = "ls -l";
      c = "clear";
      la = "ls -a";
      nup = "sudo nixos-rebuild switch --flake ~/nixos-config";
    };
    history.size = 10000;
  };
  home.sessionVariables = {

    EDITOR = "vim";

  };
  programs.kitty = {
    enable = true;
    # font_family="Cascadia Code";
    settings = {
      font_size = 14;
      font_family = "Cascadia Code";

      confirm_os_window_close = -1;
      blur = 5;
      background_opacity = 0.7;
      shell = "zsh";
    };
  };
}

