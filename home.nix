{
  config,
  pkgs,
  lib,
  ...
}: {
  home.username = "greenflame41";
  home.homeDirectory = "/home/greenflame41";
  home.stateVersion = "24.11";
  programs.git = {
    enable = true;
    userName = "Sai-Prabhav";
    userEmail = "saiprabhav.ss@gmail.com";
  };
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    fzf
    gdtoolkit_4
    opencv
    godot
    gparted
    aseprite
    llvmPackages_20.clang-tools
    alejandra
    ncurses
    ftxui
    zip
    nodePackages_latest.prettier
    appimage-run
    baobab
    tailwindcss-language-server
    typescript
    stylua
    typescript-language-server
    vscode-langservers-extracted
    ffmpeg
    vlc
    lua-language-server
    texlab
    elan
    zathura
    xclip
    gimp
    gnumake
    unzip
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
    yarn
    obsidian
    texlive.combined.scheme-medium
    tree-sitter

    pkgs.nodejs # Required for pyright
    pkgs.pyright
    (pkgs.python312.withPackages
      (ps:
        with ps; [
          pip
          pygame
          black
          isort
          numpy
          jupyter
          notebook
          matplotlib
        ]))
  ];

  nixpkgs.config.allowUnfree = true;

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      source = ~/nixos-config/hypr/hypr.conf
    '';
  };
  home.file.".prettierrc".text = ''
    {
      "printWidth": 56
    }
  '';
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh.enable = true;
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    initContent = ''

      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';

    shellAliases = {
      ll = "ls -l";
      c = "clear";
      la = "ls -a";
      nup = "nix flake update ~/nixos-config";
      nre = "sudo nixos-rebuild switch --flake ~/nixos-config";
      ssh-setup = ''
        if ! pgrep -u "$USER" ssh-agent >/dev/null; then eval $(ssh-agent); fi; ssh-add ~/nixos-config/.ssh/id_ed25519'';
    };
    history.size = 10000;
  };
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  programs.kitty = {
    enable = true;
    settings = {
      font_size = 14;
      font_family = "Cascadia Code";

      blur = 5;
      background_opacity = 0.6;
      confirm_os_window_close = "0";
      shell = "zsh";
    };
  };
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: with p; [lua nix]))
    ];
  };
  xdg.configFile."zathura/zathurarc".text = ''
    set selection-clipboard clipboard
    set synctex true
    set synctex-editor-command "nvim --headless -c \"VimtexInverseSearch %{line} '%{input}'\""

    set notification-error-bg       rgba(255,85,85,1)
    set notification-error-fg       rgba(248,248,242,1)
    set notification-warning-bg     rgba(255,184,108,1)
    set notification-warning-fg     rgba(68,71,90,1)
    set notification-bg             rgba(40,42,54,1)
    set notification-fg             rgba(248,248,242,1)

    set completion-bg               rgba(40,42,54,1)
    set completion-fg               rgba(98,114,164,1)
    set completion-group-bg         rgba(40,42,54,1)
    set completion-group-fg         rgba(98,114,164,1)
    set completion-highlight-bg     rgba(68,71,90,1)
    set completion-highlight-fg     rgba(248,248,242,1)

    set index-bg                    rgba(40,42,54,1)
    set index-fg                    rgba(248,248,242,1)
    set index-active-bg             rgba(68,71,90,1)
    set index-active-fg             rgba(248,248,242,1)

    set inputbar-bg                 rgba(40,42,54,1)
    set inputbar-fg                 rgba(248,248,242,1)
    set statusbar-bg                rgba(40,42,54,1)
    set statusbar-fg                rgba(248,248,242,1)

    set highlight-color             rgba(255,184,108,0.5)
    set highlight-active-color      rgba(255,121,198,0.5)

    set default-bg                  rgba(40,42,54,1)
    set default-fg                  rgba(248,248,242,1)

    set render-loading              true
    set render-loading-fg           rgba(40,42,54,1)
    set render-loading-bg           rgba(248,248,242,1)
    set recolor-lightcolor          rgba(40,42,54,1)
    set recolor-darkcolor           rgba(248,248,242,1)

    set adjust-open width
    set recolor true  '';

  xdg.configFile."nvim/init.lua".text = ''
    -- Add your Lua config dir to package.path
    package.path = vim.fn.expand("~").. "/nixos-config/nvim/lua/?.lua;" ..
                   vim.fn.expand("~").. "/nixos-config/nvim/lua/?/init.lua;" ..
                   package.path

    dofile(vim.fn.expand("~").. "/nixos-config/nvim/init.lua")
  '';
}
