{ inputs, pkgs, ... }: 
let 
  _2048 = pkgs.callPackage ../../pkgs/2048/default.nix {}; 
in
{
  home.packages = (with pkgs; [
    _2048

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
    bleachbit                         # cache cleaner
    beeper
    inkscape
    jetbrains.clion
    kicad
    gimp
    libreoffice
    nix-prefetch-github
    pavucontrol                       # pulseaudio volume controle (GUI)
    qalculate-gtk                     # calculator
    saleae-logic-2
    soundwireserver                   # pass audio to android phone
    thunderbird
    vlc
    winetricks
    wineWowPackages.wayland
    zenity

    # C / C++
    gcc
    gdb
    gnumake
    platformio-core

    # Python
    python3
    python312Packages.ipython

    # FS
    lxqt.lxqt-policykit

    inputs.alejandra.defaultPackage.${system}
  ]);
}
