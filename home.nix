{ config, pkgs, lib, ... }:

{
  # match your user
  home.username = "greenflame41";
  home.homeDirectory = "/home/greenflame41";
  home.stateVersion = "24.11";   # sync with system.stateVersion

  # let HM install & manage itself
  programs.home-manager.enable = true;

  # now your user-level stuff:
  home.packages = with pkgs; [
    # …any other dot-files tools…
  zsh 
  discord
 ];
 nixpkgs.config.allowUnfree = true;

  # example: enable zsh
  programs.zsh ={
	enable = true;
	enableCompletion  = true;
	autosuggestion.enable = true;
	syntaxHighlighting.enable = true;
	oh-my-zsh={
		
		enable=true;
		
		};

	shellAliases = {
		lr = "ls -l";
		la = "ls -la";
		nup = "sudo nixos-rebuild switch --flake ~/nixos-config";
  		};
  history.size = 10000;
};
  home.sessionVariables = {

    EDITOR = "vim";
  };

}

