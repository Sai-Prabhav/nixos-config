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
 ];

  # example: enable zsh
  programs.zsh ={
	enable = true;
	oh-my-zsh={
		
		enable=true;
		
		};
	
	};
  # session vars, etc.
  home.sessionVariables = {
    EDITOR = "vim";
  };
}

