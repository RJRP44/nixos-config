{ lib, inputs, pkgs, ... }:
let 
  _2048 = pkgs.callPackage ../../pkgs/2048/default.nix {};
  esp-idf = pkgs.callPackage ../../pkgs/esp-idf/default.nix {};
  envVarsWrapper = import ./env-wrapper.nix { inherit lib pkgs; };

in
{

xdg.desktopEntries.spotify = {
    name = "Spotify";
    genericName = "Music Player";
    exec = "spotify --enable-features=UseOzonePlatform --ozone-platform=wayland"; # this is the main fix and the rest is to conform with original
    icon = "spotify-client";
    categories = [
      "Audio"
      "Music"
      "Player"
      "AudioVideo"
    ];
    settings = {
      TryExec = "spotify";
    };
  };

  xdg.desktopEntries.beepertexts = {
        name = "Beeper";
        genericName = "The ultimate messaging app";
        exec = "beeper --enable-features=UseOzonePlatform --ozone-platform=wayland"; # this is the main fix and the rest is to conform with original
        icon = "beepertexts";
        categories = [
          "Network"
          "InstantMessaging"
        ];
      };

  xdg.desktopEntries.discord = {
      name = "Discord";
      genericName = "All-in-one cross-platform voice and text chat for gamers";
      exec = "discord --enable-features=UseOzonePlatform --ozone-platform=wayland"; # this is the main fix and the rest is to conform with original
      icon = "discord";
      categories = [
        "Network"
        "InstantMessaging"
      ];
    };


      xdg.desktopEntries.kicad = {
          name = "Kicad";
          exec = "kicad";
          icon = "kicad";
          categories = [
            "Science"
            "Electronics"
          ];
        };

      xdg.desktopEntries.rcu = {
          name = "RCU";
          genericName = "Remarkable Connection Utility";
          exec = "rcu";
          icon = "${pkgs.rcu.outPath}/share/icons/hicolor/scalable/apps/rcu.svg";
        };


  home.packages = (with pkgs; [

    fprintd
    xournalpp

    pcl

    (envVarsWrapper.wrap rcu {
      QT_QPA_PLATFORM="wayland";
    })



    hyprpanel

    (envVarsWrapper.wrap kicad {
      #GDK_BACKEND="x11";
      #KICAD_USE_EGL=ON;
      GTK_THEME="Breeze";
    })

    imagemagick

    keepass

    notion-app-enhanced

    #wxGTK32
    openocd

    nfs-utils


    freecad-wayland

    fontfinder

    affine

    prusa-slicer

    spotify
    
   
    #esp-idf
    #firefox-esr
    owncloud-client

    _2048
    android-studio
    jetbrains.webstorm
    pomodoro-gtk
    alacritty

    vscode

    go
    jetbrains.goland
    jetbrains.dataspell
    jetbrains.pycharm-professional
    jetbrains.idea-community-bin


    ## MX2S mouse
    solaar

    nodejs
    typescript
    postman
    jetbrains.datagrip

    ## CLI utility
    ani-cli
    binsider
    bitwise                           # cli tool for bit / hex manipulation
    caligula                          # User-friendly, lightweight TUI for disk imaging
    cliphist                          # clipboard manager
    docfd                             # TUI multiline fuzzy document finder
    eza                               # ls replacement
    entr                              # perform action when file change
    fd                                # find replacement
    ffmpeg
    file                              # Show file information 
    gtt                               # google translate TUI
    gifsicle                          # gif utility
    gtrash                            # rm replacement, put deleted files in system trash
    hexdump
    imv                               # image viewer
    killall
    lazygit
    libnotify
	  man-pages					            	  # extra man pages
    mpv                               # video player
    ncdu                              # disk space
    nitch                             # systhem fetch util
    openssl
    onefetch                          # fetch utility for git repo
    pamixer                           # pulseaudio command line mixer
    playerctl                         # controller for media players
    poweralertd
    programmer-calculator
    qview                             # minimal image viewer
    ripgrep                           # grep replacement
    tdf                               # cli pdf viewer
    tldr
    todo                              # cli todo list
    toipe                             # typing test in the terminal
    ttyper                            # cli typing test
    unzip
    valgrind                          # c memory analyzer
    wl-clipboard                      # clipboard utils for wayland (wl-copy, wl-paste)
    wget
    yazi                              # terminal file manager
    yt-dlp-light
    xdg-utils
    xxd
    libusb1
    hidapi

    ## CLI 
    cbonsai                           # terminal screensaver
    cmatrix
    pipes                             # terminal screensaver
    sl
    tty-clock                         # cli clock

    ## LATEX
    texliveFull
    texstudio

    ## GUI Apps
    anki
    audacity
    beeper
    inkscape
    jetbrains.clion
#    kicad
    gimp
    libreoffice
    nix-prefetch-github
    pavucontrol                       # pulseaudio volume controle (GUI)
    qalculate-gtk                     # calculator
    saleae-logic-2
    soundwireserver                   # pass audio to android phone
    thunderbird
    vlc
    galaxy-buds-client
    networkmanagerapplet
    blueman
    winetricks
    wineWow64Packages.waylandFull
    zenity

    # C / C++
    gcc
    gdb
    gnumake
    platformio-core

    # Python
    python310
	 
	 # Java
	 jdk17
	 
    # FS
    lxqt.lxqt-policykit

    inputs.alejandra.defaultPackage.${system}
  ]);
}
