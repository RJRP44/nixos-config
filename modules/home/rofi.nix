{ pkgs, ... }: 
{
  home.packages = (with pkgs; [ rofi-wayland ]);

  xdg.configFile."rofi/theme.rasi".text = ''
    * {
      bg-col: #1D2021;
      bg-col-light: #282828;
      border-col: #928374;
      selected-col: #3C3836;
      green: #3A86FF;
      fg-col: #FBF1C7;
      fg-col2: #EBDBB2;
      grey: #BDAE93;
      highlight: #3A86FF;
    }
  '';

  xdg.configFile."rofi/config.rasi".text = ''
    configuration{
      modi: "drun";
      lines: 5;
      cycle: false;
      font: "JetBrainsMono NF Bold 15";
      show-icons: true;
      icon-theme: "Papirus-dark";
      terminal: "alacritty";
      drun-display-format: "{icon} {name}";
      location: 0;
      disable-history: true;
      hide-scrollbar: true;
      display-drun: "  ";
      display-Network: " Network";
      sidebar-mode: true;
      sorting-method: "fzf";
    }

    @theme "theme"

    element-text, element-icon {
      background-color: inherit;
      text-color:       inherit;
    }

    window {
      height: 400px;
      width: 400px;
      border: 3px;
      border-color: @border-col;
      background-color: @bg-col;
       border-radius:  15px;
    }

    mode-switcher {
        enabled: false;
    }

    mainbox {
      background-color: @bg-col;
    }

    inputbar {
      children: [prompt,entry];
      background-color: @bg-col-light;
      padding: 0px;
    }

    prompt {
      background-color: @bg-col-light;
      padding: 4px;
      text-color: @green;
      margin: 10px 0px 10px 10px;
    }

    textbox-prompt-colon {
      expand: true;
      str: ":";
    }

    entry {
      padding: 6px;
      margin: 10px 10px 10px 5px;
      text-color: @fg-col;
      background-color: @bg-col-light;
      border-radius: 5px;
    }

    listview {
      border: 0px 0px 0px;
      padding: 6px 0px 0px;
      margin: 10px 0px 0px 6px;
      columns: 1;
      background-color: @bg-col;
    }

    element {
      padding: 8px;
      margin: 0px 10px 4px 4px;
      background-color: @bg-col;
      text-color: @fg-col;
    }

    element-icon {
      size: 28px;
    }

    element selected {
      background-color:  @selected-col ;
      text-color: @fg-col2  ;
      border-radius: 10px;
    }
  '';  
}
